import 'dart:io';
import 'dart:async';
import 'dart:convert';



actInfo(String accountHolder) async {
  var file = File('C:/flutter/dart/banker/balances.csv');
  var contents;
  var col;
  var balance;
//  String accountHolder = "33668201";

  if (await file.exists()) {
    // Read file
    contents = await file.readAsString();
    col = contents.split('\r\n');
  }

  for (var n in col) {
    List row = n.split(',');
    if (row[0] == accountHolder) {
      print("Balance for account " + row[0] + " is \$" + row[1]);
      balance = row[1];
      break ;
    }
  }
  return balance;
}


main() async{

  stdout.write("Account Number: ");
  String actNumber = stdin.readLineSync();
  String  BalanceString = await   actInfo(actNumber);
  double Balance = double.parse(BalanceString);

  String inputText = "0";
//  double Balance = 1000.0;

  while (int.parse(inputText) < 5) {
    stdout.write("   1. Check Balance\n   2. Withdraw\n   5. Exit\nCommand: ");
    inputText = stdin.readLineSync();
    print('You entered: ' + inputText + "\n");

    switch (inputText) {
      case "1":
        {
          print("Balance: " + Balance.toString() + "\n");
        }
        break;

      case "2":
        {
          print("Withdrawal...");
          stdout.write("Amount to withdraw: ");
          String inputAmt = stdin.readLineSync();
          var Amt = double.parse(inputAmt);
          if (Amt < Balance) {
            stdout.write("Dispensing " + inputAmt + "...\n\n");
            Balance = Balance - Amt;
            print("Balance: " + Balance.toString() + "\n");
          } else {
            stdout.write("Insuficient funds\n\n");
          }
        }
        break;

      case "3":
        {
          print("Not available");
        }
        break;

      case "4":
        {
          print("Not available");
        }
        break;

      case "5":
        {
          print("Exiting...");
        }
        break;

      default:
        {
          print("Invalid choice");
        }
        break;
    }
  }
}

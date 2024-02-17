/*
  Warnings:

  - You are about to drop the column `adress` on the `Index` table. All the data in the column will be lost.
  - Added the required column `address` to the `Index` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Employee" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "firstName" TEXT NOT NULL,
    "lastName" TEXT NOT NULL,
    "age" TEXT NOT NULL,
    "address" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    CONSTRAINT "Employee_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Employee" ("age", "firstName", "id", "lastName", "userId") SELECT "age", "firstName", "id", "lastName", "userId" FROM "Index";
DROP TABLE "Index";
ALTER TABLE "new_Employee" RENAME TO "Index";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;

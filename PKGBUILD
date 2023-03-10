# Maintainer: Andre Smit <freevryheid@gmail.com>
pkgname=duckdb-bin
pkgver=0.7.1
pkgrel=3
pkgdesc="An in-process SQL OLAP database management system"
arch=('x86_64')
url="https://duckdb.org"
license=('MIT')
conflicts=('duckdb' 'duckdb-git')
source=("https://github.com/duckdb/duckdb/releases/download/v${pkgver}/duckdb_cli-linux-amd64.zip" "https://github.com/duckdb/duckdb/releases/download/v${pkgver}/libduckdb-linux-amd64.zip")
sha256sums=('ca44c8dceea83287ba2b22216344f432e706e2dafe27a8c8cfd9bfaf77f4767f' '1c15e0f142f6183e60d7a77b068b902532264519f2fd08dedc18573b7f507251')
package() {
	install -D -m755 $srcdir/duckdb $pkgdir/usr/bin/duckdb
	install -D -m755 $srcdir/libduckdb.so $pkgdir/usr/lib/libduckdb.so
	install -D -m644 $srcdir/duckdb.h $pkgdir/usr/include/duckdb.h
	install -D -m644 $srcdir/duckdb.hpp $pkgdir/usr/include/duckdb.hpp
}

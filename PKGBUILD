# Maintainer: Andre Smit <freevryheid@gmail.com>
pkgname=duckdb-bin
pkgver=0.8.0
pkgrel=1
pkgdesc="An in-process SQL OLAP database management system"
arch=("x86_64")
url="https://duckdb.org"
license=("MIT")
conflicts=("duckdb" "duckdb-git")
source=("https://github.com/duckdb/duckdb/releases/download/v${pkgver}/duckdb_cli-linux-amd64.zip"
        "https://github.com/duckdb/duckdb/releases/download/v${pkgver}/libduckdb-linux-amd64.zip")
sha256sums=('bc5cb74015e7d164ac0cf160df62625b7024003b48a7507bcde486fcad1120b7'
            '3d8ab93d0775b0a9518dc1a37b487882bc680df3aca5439d86bf34bed8531af4')
package() {
	install -D -m755 $srcdir/duckdb $pkgdir/usr/bin/duckdb
	install -D -m755 $srcdir/libduckdb.so $pkgdir/usr/lib/libduckdb.so
	install -D -m644 $srcdir/duckdb.h $pkgdir/usr/include/duckdb.h
	install -D -m644 $srcdir/duckdb.hpp $pkgdir/usr/include/duckdb.hpp
}

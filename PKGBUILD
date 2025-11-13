# Maintainer: Andre Smit <freevryheid@gmail.com>
# Maintainer: tee < teeaur at duck dot com >
pkgname=duckdb-bin
pkgver=1.4.2
pkgrel=1
pkgdesc="An in-process SQL OLAP database management system"
# arch=("arm64" "x86_64")
arch=("x86_64")
url="https://duckdb.org"
license=("MIT")
provides=("duckdb")
conflicts=("duckdb" "duckdb-git")
#source_arm64=("duckdb_cli-linux-arm64-${pkgver}-${pkgrel}.zip::https://github.com/duckdb/duckdb/releases/download/v${pkgver}/duckdb_cli-linux-arm64.zip"
#        "libduckdb-linux-arm64-${pkgver}-${pkgrel}.zip::https://github.com/duckdb/duckdb/releases/download/v${pkgver}/libduckdb-linux-arm64.zip")
#sha256sums_arm64=('04b394d4e2fa90fc135b3417a3fbadbb765de7cec01a80f179bf854f8ac702a3'
#                    'dc7146d861712a3b5f75a08e4e220306db713133933246c5b2cc39274d188828')
sha256sums_x86_64=('fae3ba93eedf20b08bca4b23aeac1ba94c446f1c10d029c193e2fc4b4e0bc1bc'
                   '0a68e623cbdcfa06e10e1b5d6a3092d3fd3679f616008fb1a39b92e4a10d8f43')
source_x86_64=("duckdb_cli-linux-amd64-${pkgver}-${pkgrel}.zip::https://github.com/duckdb/duckdb/releases/download/v${pkgver}/duckdb_cli-linux-amd64.zip"
        "libduckdb-linux-amd64-${pkgver}-${pkgrel}.zip::https://github.com/duckdb/duckdb/releases/download/v${pkgver}/libduckdb-linux-amd64.zip")
package() {
	install -D -m755 "$srcdir/duckdb" "$pkgdir/usr/bin/duckdb"
	install -D -m755 "$srcdir/libduckdb.so" "$pkgdir/usr/lib/libduckdb.so"
	install -D -m644 "$srcdir/duckdb.h" "$pkgdir/usr/include/duckdb.h"
	install -D -m644 "$srcdir/duckdb.hpp" "$pkgdir/usr/include/duckdb.hpp"
	install -D -m644 "$startdir/duckdb.pc" "$pkgdir/usr/lib/pkgconfig/duckdb.pc"
}

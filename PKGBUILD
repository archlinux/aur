# Maintainer: Andre Smit <freevryheid@gmail.com>
# Maintainer: tee < teeaur at duck dot com >
pkgname=duckdb-bin
pkgver=1.4.0
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
sha256sums_x86_64=('559398da12db9223fb0663ae65a365b2740e4e35abf009a81350a3f57e175ecc'
                   '3e7a902ee6cddf7d55035903cf26f14a9a45302bed6fbd379cf34e1c9cc9983f')
source_x86_64=("duckdb_cli-linux-amd64-${pkgver}-${pkgrel}.zip::https://github.com/duckdb/duckdb/releases/download/v${pkgver}/duckdb_cli-linux-amd64.zip"
        "libduckdb-linux-amd64-${pkgver}-${pkgrel}.zip::https://github.com/duckdb/duckdb/releases/download/v${pkgver}/libduckdb-linux-amd64.zip")
package() {
	install -D -m755 $srcdir/duckdb $pkgdir/usr/bin/duckdb
	install -D -m755 $srcdir/libduckdb.so $pkgdir/usr/lib/libduckdb.so
	install -D -m644 $srcdir/duckdb.h $pkgdir/usr/include/duckdb.h
#	install -D -m644 $srcdir/duckdb.hpp $pkgdir/usr/include/duckdb.hpp
	install -D -m644 $startdir/duckdb.pc $pkgdir/usr/lib/pkgconfig/duckdb.pc
}

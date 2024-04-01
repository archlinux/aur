# Maintainer: Andre Smit <freevryheid@gmail.com>
pkgname=duckdb-bin
pkgver=0.10.1
pkgrel=1
pkgdesc="An in-process SQL OLAP database management system"
# arch=("aarch64" "armv7h" "i686" "x86_64")
arch=("aarch64" "x86_64")
url="https://duckdb.org"
license=("MIT")
provides=("duckdb")
conflicts=("duckdb" "duckdb-git")
source_aarch64=("duckdb_cli-linux-aarch64-${pkgver}-${pkgrel}.zip::https://github.com/duckdb/duckdb/releases/download/v${pkgver}/duckdb_cli-linux-aarch64.zip"
        "libduckdb-linux-aarch64-${pkgver}-${pkgrel}.zip::https://github.com/duckdb/duckdb/releases/download/v${pkgver}/libduckdb-linux-aarch64.zip")
sha256sums_aarch64=('5cc87ba66ac86f205208c169975d308ec75c0f5b402dee80b57b5916456998fe'
                    '73843c168102842107fda863f77d4a59cd8365b594103c6c15d060b3dfdae8f7')
sha256sums_x86_64=('be3cc6817ac35f4dec5a0ca329cde3046f8ef706fc484d175ee8994b9dfa60fb'
                   '142f5837e132d9381a4e6f67419587cba2865e28f854281b5b6a1cf050b95213')
# sha256sums_armv7h=('ce8a72aca9467a7aa13293b297801110c14f07ae240736a7d773a0c19bbcdad4'
#                    '60a1cf7ddb915bca91e5088ea2d9b15306321e920d80823d1594238d3064c55a')
# sha256sums_i686=('679a0d3795176d169db200156414db1a2c9f16c2a8599cc3751753a8e087ee1e'
#                  '93bb783cbaf44b4485f0fb4180666f6a1da0da5c947026d5c73ce4e346043af7')
# source_armv7h=("duckdb_cli-linux-rpi-${pkgver}-${pkgrel}.zip::https://github.com/duckdb/duckdb/releases/download/v${pkgver}/duckdb_cli-linux-rpi.zip"
#         "libduckdb-linux-rpi-${pkgver}-${pkgrel}.zip::https://github.com/duckdb/duckdb/releases/download/v${pkgver}/libduckdb-linux-rpi.zip")
# source_i686=("duckdb_cli-linux-i386-${pkgver}-${pkgrel}.zip::https://github.com/duckdb/duckdb/releases/download/v${pkgver}/duckdb_cli-linux-i386.zip"
#         "libduckdb-linux-i386-${pkgver}-${pkgrel}.zip::https://github.com/duckdb/duckdb/releases/download/v${pkgver}/libduckdb-linux-i386.zip")
source_x86_64=("duckdb_cli-linux-amd64-${pkgver}-${pkgrel}.zip::https://github.com/duckdb/duckdb/releases/download/v${pkgver}/duckdb_cli-linux-amd64.zip"
        "libduckdb-linux-amd64-${pkgver}-${pkgrel}.zip::https://github.com/duckdb/duckdb/releases/download/v${pkgver}/libduckdb-linux-amd64.zip")
package() {
	install -D -m755 $srcdir/duckdb $pkgdir/usr/bin/duckdb
	install -D -m755 $srcdir/libduckdb.so $pkgdir/usr/lib/libduckdb.so
	install -D -m644 $srcdir/duckdb.h $pkgdir/usr/include/duckdb.h
	install -D -m644 $srcdir/duckdb.hpp $pkgdir/usr/include/duckdb.hpp
	install -D -m644 $startdir/duckdb.pc $pkgdir/usr/lib/pkgconfig/duckdb.pc
}

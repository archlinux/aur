# Maintainer: Andre Smit <freevryheid@gmail.com>
pkgname=duckdb-bin
pkgver=0.10.0
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
sha256sums_aarch64=('7cafcf2457b7882041d3e692b21581329adfc57b27e56069534472bd459af923'
                    '0a4fbd1c937d675b4f2fd533658c6c0923d084d107da022074115f8f4b71688f')
sha256sums_x86_64=('66859c2e8aad5cfd13e12704f7b372bffbcfd76c7154b8f1442ec1291fb7f288'
                   '5e6a578bc985ef8fc5cbf1a9561fafce3900b892823dbca58a158d24a49fcd28')
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

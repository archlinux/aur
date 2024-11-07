# Maintainer: Andre Smit <freevryheid@gmail.com>
# Maintainer: tee < teeaur at duck dot com >
pkgname=duckdb-bin
pkgver=1.1.3
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
sha256sums_aarch64=('6e6caaab69a9c8d77c4400e88197695b072a98b678f6f8ffb015af4f02b13618'
                    '9069db3627456ab8b14399a73cd8d450c7863b1bc93b2b197d157ea18bad7801')
sha256sums_x86_64=('efd0fccdb1a28d9ec7a6ebfcde59900068b8ba43a846c9b553c0fd2bbe4acf43'
                   '81199bf01b6d49941a38f426cad60e73c1ccd43f1f769a65ed8097d53fc7e40b')
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

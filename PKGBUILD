# Maintainer: Andre Smit <freevryheid@gmail.com>
pkgname=duckdb-bin
pkgver=0.8.1
pkgrel=4
pkgdesc="An in-process SQL OLAP database management system"
arch=("aarch64" "armv7h" "i686" "x86_64")
url="https://duckdb.org"
license=("MIT")
provides=("duckdb")
conflicts=("duckdb" "duckdb-git")
source_aarch64=("duckdb_cli-linux-aarch64-${pkgver}-${pkgrel}.zip::https://github.com/duckdb/duckdb/releases/download/v${pkgver}/duckdb_cli-linux-aarch64.zip"
        "libduckdb-linux-aarch64-${pkgver}-${pkgrel}.zip::https://github.com/duckdb/duckdb/releases/download/v${pkgver}/libduckdb-linux-aarch64.zip")
sha256sums_aarch64=('1e5504bb01c20ff03c1615f6ba743c1a810cf7394cbf9874b8401bbec48043ac'
                    'dc396aa224bcc190f29c9b3993ea366cb75f6b5edc28028484520d74e1ae590b')
sha256sums_armv7h=('ce8a72aca9467a7aa13293b297801110c14f07ae240736a7d773a0c19bbcdad4'
                   '60a1cf7ddb915bca91e5088ea2d9b15306321e920d80823d1594238d3064c55a')
sha256sums_i686=('679a0d3795176d169db200156414db1a2c9f16c2a8599cc3751753a8e087ee1e'
                 '93bb783cbaf44b4485f0fb4180666f6a1da0da5c947026d5c73ce4e346043af7')
sha256sums_x86_64=('892ae08f39598124180fbd2912895beb116f5ca0f32e9657db2376f3d58fec97'
                   '767c4163df6c6fb8dc07d44d6db3d081437544282185f4aae9bd1a9d9517a6c9')
source_armv7h=("duckdb_cli-linux-rpi-${pkgver}-${pkgrel}.zip::https://github.com/duckdb/duckdb/releases/download/v${pkgver}/duckdb_cli-linux-rpi.zip"
        "libduckdb-linux-rpi-${pkgver}-${pkgrel}.zip::https://github.com/duckdb/duckdb/releases/download/v${pkgver}/libduckdb-linux-rpi.zip")
source_i686=("duckdb_cli-linux-i386-${pkgver}-${pkgrel}.zip::https://github.com/duckdb/duckdb/releases/download/v${pkgver}/duckdb_cli-linux-i386.zip"
        "libduckdb-linux-i386-${pkgver}-${pkgrel}.zip::https://github.com/duckdb/duckdb/releases/download/v${pkgver}/libduckdb-linux-i386.zip")
source_x86_64=("duckdb_cli-linux-amd64-${pkgver}-${pkgrel}.zip::https://github.com/duckdb/duckdb/releases/download/v${pkgver}/duckdb_cli-linux-amd64.zip"
        "libduckdb-linux-amd64-${pkgver}-${pkgrel}.zip::https://github.com/duckdb/duckdb/releases/download/v${pkgver}/libduckdb-linux-amd64.zip")
package() {
	install -D -m755 $srcdir/duckdb $pkgdir/usr/bin/duckdb
	install -D -m755 $srcdir/libduckdb.so $pkgdir/usr/lib/libduckdb.so
	install -D -m644 $srcdir/duckdb.h $pkgdir/usr/include/duckdb.h
	install -D -m644 $srcdir/duckdb.hpp $pkgdir/usr/include/duckdb.hpp
	install -D -m644 $startdir/duckdb.pc $pkgdir/usr/lib/pkgconfig/duckdb.pc
}

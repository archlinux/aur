# Maintainer: Andre Smit <freevryheid@gmail.com>
pkgname=duckdb-bin
pkgver=0.8.1
pkgrel=3
pkgdesc="An in-process SQL OLAP database management system"
arch=("x86_64")
url="https://duckdb.org"
license=("MIT")
provides=("duckdb")
conflicts=("duckdb" "duckdb-git")
source=("duckdb_cli-linux-amd64-${pkgver}-${pkgrel}.zip::https://github.com/duckdb/duckdb/releases/download/v${pkgver}/duckdb_cli-linux-amd64.zip"
        "libduckdb-linux-amd64-${pkgver}-${pkgrel}.zip::https://github.com/duckdb/duckdb/releases/download/v${pkgver}/libduckdb-linux-amd64.zip")
sha256sums=('892ae08f39598124180fbd2912895beb116f5ca0f32e9657db2376f3d58fec97'
            '767c4163df6c6fb8dc07d44d6db3d081437544282185f4aae9bd1a9d9517a6c9')
package() {
	install -D -m755 $srcdir/duckdb $pkgdir/usr/bin/duckdb
	install -D -m755 $srcdir/libduckdb.so $pkgdir/usr/lib/libduckdb.so
	install -D -m644 $srcdir/duckdb.h $pkgdir/usr/include/duckdb.h
	install -D -m644 $srcdir/duckdb.hpp $pkgdir/usr/include/duckdb.hpp
	install -D -m644 $startdir/duckdb.pc $pkgdir/usr/lib/pkgconfig/duckdb.pc
}

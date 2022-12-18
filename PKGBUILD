# Maintainer: Fahim Montasir Misbah <fahimscirex@tutanota.com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Malte Rabenseifner <malte@zearan.de>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Bernhard Walle <bernhard.walle@gmx.de>

pkgname=libnxml
pkgver=0.18.4
pkgrel=2
pkgdesc="C library for parsing, writing and creating XML 1.0 and 1.1 files or streams"
url="https://github.com/bakulf/libnxml"
arch=('x86_64')
license=('LGPL')
depends=('libcurl.so')
provides=('libnxml.so')
source=("$pkgname-$pkgver.tar.gz::$url/archive/887a515.tar.gz")
sha256sums=('f8278d5302204775720ee319407aa18d2b20d988834c81e9507c0c70cbfbfd39')

prepare() {
	mv libnxml-887a515b83feeca309c4740822e676812fff5df9 "$pkgname-$pkgver"
}

build() {
	cd "$pkgname-$pkgver"
	./autogen.sh
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}

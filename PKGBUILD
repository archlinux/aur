# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

# libquvi version 0.4.x (suitable for FFMpeg build).
# FFmmpeg doesn't compile with libquvi version 0.9.x API, so it's necessary to use version 0.4.x.

_srcname="libquvi"
pkgname=libquvi0.4
pkgver=0.4.1
pkgrel=1
pkgdesc="Library for parsing flash media stream URLs with C API (version 0.4)"
arch=('i686' 'x86_64')
url="http://quvi.sourceforge.net/"
license=('LGPL2.1')
depends=('libquvi-scripts0.4' 'curl' 'lua')
provides=('libquvi')
conflicts=('libquvi')
source=("http://sourceforge.net/projects/quvi/files/0.4/libquvi/${_srcname}-${pkgver}.tar.xz")
sha256sums=('b5862f7e5fa6ed7defd169adb5c7586c6406af86e029671fd09615f6eb7aa903')

build() {
	cd "$_srcname"-"$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$_srcname"-"$pkgver"
	make DESTDIR="$pkgdir/" install
}

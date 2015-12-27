# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

# libquvi-scripts version 0.4.x (suitable for FFMpeg build).
# FFmmpeg doesn't compile with libquvi version 0.9.x API, so it's necessary to use version 0.4.x.

_srcname="libquvi-scripts"
pkgname=libquvi-scripts0.4
pkgver=0.4.21
pkgrel=1
pkgdesc="Scripts used by libquvi (version 0.4)"
arch=('any')
url="http://quvi.sourceforge.net/"
license=('LGPL2.1')
provides=('libquvi-scripts')
conflicts=('libquvi-scripts')
source=("http://sourceforge.net/projects/quvi/files/0.4/libquvi-scripts/${_srcname}-${pkgver}.tar.xz")
sha256sums=('7c02cc86ac25334892d08bbc31251d78a55ee2a16d57dfa2bda7ac657c8e0f34')

build() {
	cd "$_srcname"-"$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$_srcname"-"$pkgver"
	make DESTDIR="$pkgdir/" install
}

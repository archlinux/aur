# Maintainer: Martin Tournoij <martin@arp242.net>

pkgname=pqiv
pkgver=2.6
pkgrel=1
pkgdesc="Modern rewrite of Quick Image Viewer"
arch=('i686' 'x86_64')
url="https://github.com/phillipberndt/pqiv/"
license=('GPL3')
depends=('gtk3')  # Also works with GTK2...
optdepends=(
'libspectre: PS/EPS support'
'poppler: PDF support'
'imagemagick: additional image formats like psd'
)
install=
source=($pkgname-$pkgver.tar.gz::https://github.com/phillipberndt/pqiv/archive/$pkgver.tar.gz)
sha256sums=('f0c0d803724cdde2ccac1dc8d7e8928bdc633e758914a67320734a6961ee099c')

build() {
	cd $pkgname-$pkgver
	make
}

package() {
	cd $pkgname-$pkgver
	make DESTDIR=$pkgdir install
}

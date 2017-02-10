# Maintainer: Martin Tournoij <martin@arp242.net>

pkgname=pqiv
pkgver=2.7.4
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
sha256sums=('2c6acd9c031de3afdd231d71223566e229dafbb1bce1a88a6b11e91b9c3a817d')

build() {
	cd $pkgname-$pkgver
	make
}

package() {
	cd $pkgname-$pkgver
	make DESTDIR=$pkgdir install
}

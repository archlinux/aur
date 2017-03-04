# Maintainer: Martin Tournoij <martin@arp242.net>

pkgname=pqiv
pkgver=2.8.3
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
sha256sums=('b90c45d829eb180459dcfbf1420b8feb670dc9bb542fe307adbc4ff201445bbd')

build() {
	cd $pkgname-$pkgver
	make
}

package() {
	cd $pkgname-$pkgver
	make DESTDIR=$pkgdir install
}

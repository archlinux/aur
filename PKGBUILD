# Maintainer: Martin Tournoij <martin@arp242.net>

pkgname=pqiv
pkgver=2.5.1
pkgrel=1
pkgdesc="Modern rewrite of Quick Image Viewer"
arch=('i686' 'x86_64')
url="https://github.com/phillipberndt/pqiv/"
license=('GPL3')
depends=('gtk2')  # Also works with GTK3...
optdepends=(
'libspectre: PS/EPS support'
'poppler: PDF support'
'imagemagick: additional image formats like psd'
)
install=
source=($pkgname-$pkgver.tar.gz::https://github.com/phillipberndt/pqiv/archive/$pkgver.tar.gz)
sha256sums=('de027c5ebab80a19066e3a891edf76c58ba1622e45227db380349eec214898bc')

build() {
	cd $pkgname-$pkgver
	make
}

package() {
	cd $pkgname-$pkgver
	make DESTDIR=$pkgdir install
}

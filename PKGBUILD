# Maintainer: Martin Tournoij <martin@arp242.net>

pkgname=pqiv
pkgver=2.4
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
sha256sums=('d70f88bf0c906fea2d267901fc5e368c7ac75c44cdfbda238689e459f7b3a4c8')

build() {
	cd $pkgname-$pkgver
	make
}

package() {
	cd $pkgname-$pkgver
	make DESTDIR=$pkgdir install
}

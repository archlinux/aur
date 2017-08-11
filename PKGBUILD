# Maintainer: Martin Tournoij <martin@arp242.net>

pkgname=pqiv
pkgver=2.9
pkgrel=1
pkgdesc="Modern rewrite of Quick Image Viewer"
arch=('i686' 'x86_64')
url="https://github.com/phillipberndt/pqiv/"
license=('GPL3')
depends=('gtk3')  # Also works with GTK2...
optdepends=(
'libspectre: PS/EPS support'
'poppler: PDF support'
'libwebp: WebP support'
'imagemagick: additional image formats like PSD'
)
install=
source=($pkgname-$pkgver.tar.gz::https://github.com/phillipberndt/pqiv/archive/$pkgver.tar.gz)
sha256sums=('e57298ae7123bd6b01b751f6ef2d7a7853e731a3271b50095683442a406da99c')

build() {
	cd $pkgname-$pkgver
	make
}

package() {
	cd $pkgname-$pkgver
	make DESTDIR=$pkgdir install
}

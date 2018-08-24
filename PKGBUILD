# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=bcm2835
pkgver=1.56
pkgrel=1
pkgdesc="C library for the Raspberry Pi"
arch=('armv6h' 'armv7h' 'armv8h' 'i686' 'x86_64')
url="http://www.airspayce.com/mikem/bcm2835/"
license=('GPL2')
provides=('bcm2835')
source=("http://www.airspayce.com/mikem/$pkgname/$pkgname-$pkgver.tar.gz")
sha512sums=('e00b35be6f493ba9d44fd5d82aaf42c8f30a6999ae366b430fac2bd3e8877e8ed86e3259fe8bd5bcfcebaf20fc25cc4f3f601c46a8a6394415c272c9c6cd234b')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

# Disabled because the check needs root permissions
#check() {
#  cd "$pkgname-$pkgver"
#  make check
#}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:

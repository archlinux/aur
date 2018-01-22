# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=bcm2835
pkgver=1.55
pkgrel=1
pkgdesc="C library for the Raspberry Pi"
arch=('armv6h' 'armv7h' 'armv8h' 'i686' 'x86_64')
url="http://www.airspayce.com/mikem/bcm2835/"
license=('GPL2')
provides=('bcm2835')
source=("http://www.airspayce.com/mikem/$pkgname/$pkgname-$pkgver.tar.gz")
sha512sums=('fb3a54b5d82792ec6666348b27f8c1d2c9bce1751117307b2eeb4ed2b7f2dc42a0c6664f8b54391b02fda5a856b5db13ba4940560254360b360fe8424adf86bc')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

#check() {
#  cd "$pkgname-$pkgver"
#  make check
#}
# Disabled because the check needs root permission (I don't know how to fix this)

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:

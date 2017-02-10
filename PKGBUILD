# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=bcm2835
pkgver=1.52
pkgrel=1
pkgdesc="C library for the Raspberry Pi"
arch=('armv6h' 'armv7h' 'armv8h' 'i686' 'x86_64')
url="http://www.airspayce.com/mikem/bcm2835/"
license=('GPL2')
provides=('bcm2835')
source=("http://www.airspayce.com/mikem/$pkgname/$pkgname-$pkgver.tar.gz")
sha512sums=('deb342713eea971149d15071b5a4e5844ae7fbb281b36eb0e5b95d5c8287c09f945d51dcc2838c23e5a47a7a02f319a7586c6a43e48a75b69208f28bade15146')

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

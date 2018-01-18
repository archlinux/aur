# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=bcm2835
pkgver=1.53
pkgrel=1
pkgdesc="C library for the Raspberry Pi"
arch=('armv6h' 'armv7h' 'armv8h' 'i686' 'x86_64')
url="http://www.airspayce.com/mikem/bcm2835/"
license=('GPL2')
provides=('bcm2835')
source=("http://www.airspayce.com/mikem/$pkgname/$pkgname-$pkgver.tar.gz")
sha512sums=('156fb81dde1b507f5f9c6a7e5447308d3c79b9db9757f2fc76564856d15800831b2064df063cbe8ea2d930ecc0e7c101759cea524a9fc94bc88046c4e6f634a7')

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

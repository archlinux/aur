# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=bcm2835
pkgver=1.58
pkgrel=1
pkgdesc="C library for the Raspberry Pi"
arch=('armv6h' 'armv7h' 'armv8h' 'i686' 'x86_64')
url="http://www.airspayce.com/mikem/bcm2835/"
license=('GPL2')
provides=('bcm2835')
source=("http://www.airspayce.com/mikem/$pkgname/$pkgname-$pkgver.tar.gz")
sha512sums=('0adf00cffc043f04a538f7fd6009712bce5d8f18be98a0d8072dd2f0f4d82ebd3aaa9e2be99c84f8d203a1655291b6e4c26a598fafbfebd3eafcb8b37a6e06f9')

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

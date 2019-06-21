# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=cc65
pkgver=2.18
pkgrel=1
pkgdesc='C compiler for 6502 family microprocessors'
arch=('i686' 'x86_64')
license=('BSD')
url='https://cc65.github.io/cc65/'
source=(https://github.com/cc65/cc65/archive/V${pkgver}.tar.gz)
sha512sums=('47e530052911c8fdac0ea560fef78f5971441509f37b4020df54937cf9b5420e07653b3d191c844da0af5dddd17a61e90c3ad3fb56bf7623214977017b4bc9a1')

build() {
  cd "$pkgname-$pkgver"

  make PREFIX=/usr
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir" PREFIX=/usr install
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/license"
}

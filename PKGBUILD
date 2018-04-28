# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=xkblayout-state
pkgver=1b
pkgrel=1
pkgdesc="A small command-line program to get/set the current keyboard layout."
arch=('i686' 'x86_64')
license=('GPL')
url="https://github.com/nonpop/xkblayout-state"
provides=('xkblayout-state')
conflicts=('xkblayout-state')
depends=('libx11' 'gcc-libs')
source=('$pkgname-$pkgver.tar.gz::https://github.com/nonpop/xkblayout-state/archive/v1b.tar.gz')
md5sums=('SKIP')

build() {
  cd $pkgname-$pkgver
  # Does not build with --as-needed flag
  LDFLAGS=$(echo "$LDFLAGS" | sed "s/--as-needed,//")
  make all
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 "xkblayout-state" "$pkgdir"/usr/bin/xkblayout-state
}

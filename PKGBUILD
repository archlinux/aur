# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=ninvaders
pkgver=0.1.1
pkgrel=4
pkgdesc="Space Invaders clone based on ncurses"
arch=('x86_64')
url="https://ninvaders.sourceforge.net"
license=('GPL-2.0-or-later')
depends=('ncurses')
source=("$pkgname-$pkgver.tar.gz::https://downloads.sourceforge.net/sourceforge/ninvaders/$pkgname-$pkgver.tar.gz")
sha256sums=('bfbc5c378704d9cf5e7fed288dac88859149bee5ed0850175759d310b61fd30b')

build() {
  cd "$pkgname-$pkgver"
  make CFLAGS="${CFLAGS} -std=gnu11 -fcommon"
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 nInvaders "$pkgdir/usr/bin/$pkgname"
}

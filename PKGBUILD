# Maintainer: Arthur Zamarin <arthurzam@gmail.com> 

pkgname=emu8051
pkgver=2.0.1
pkgrel=1
pkgdesc="Emulator and simulator for 8051 microcontrollers"
arch=(i686 x86_64)
url="http://www.hugovil.com/fr/emu8051/index.html"
license=('GPL2')
depends=('gtk2')
source=("http://www.hugovil.com/repository/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('9546066c662ba4e99a20477ec18d20f48a78bbd326868c286d21427b4b3d6a28')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure "--prefix=/usr"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR=$pkgdir install
}

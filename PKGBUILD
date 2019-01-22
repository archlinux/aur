# Maintainer: Matt Coffin <mcoffin13@gmail.com>
pkgname=bossa
pkgver=1.9.1
pkgrel=1
pkgdesc="Flash programming utility for Atmel's SAM family of flash-based ARM microcontrollers"
arch=('i686' 'x86_64')
url="https://github.com/shumatech/BOSSA"
license=('BSD')
depends=('readline' 'wxgtk')
source=("https://github.com/shumatech/BOSSA/archive/$pkgver.tar.gz")
sha256sums=('ca650455dfa36cbd029010167347525bea424717a71a691381c0811591c93e72')

build() {
  cd "$srcdir/BOSSA-$pkgver"
  make
}

package() {
  cd "$srcdir/BOSSA-$pkgver"
  mkdir -p "$pkgdir/usr/bin"
  cp bin/bossa* "$pkgdir/usr/bin/"
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/BSD-3-Clause"
}

# vim:set ts=2 sw=2 et:

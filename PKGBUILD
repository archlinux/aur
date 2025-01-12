# Maintainer: Leandro Cunha <leandrocunha016@gmail.com>

pkgname=pngphoon
pkgver=1.3
pkgrel=1
pkgdesc="Create monochromatic image displaying the current phase of the moon"
arch=('x86_64')
url="https://git.h8u.de/svolli/pngphoon"
license=('GPL-2.0-only' 'BSD-2-Clause')
depends=('glibc' 'libpng')
source=("$url/archive/release_$pkgver.tar.gz")
sha256sums=('0a16547e869b30e085484c12672fa2707696c262a862fbcf470e63db47afdaca')

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 pngphoon "$pkgdir/usr/bin/pngphoon"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

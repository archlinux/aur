# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=redo
pkgver=1.2
pkgrel=1
pkgdesc="An implementation of Bernstein's redo proposal"
arch=('i686' 'x86_64')
makedepends=('perl')
url="https://jdebp.eu/Softwares/redo"
license=('custom:ISC')
source=(https://jdebp.eu/Repository/freebsd/$pkgname-$pkgver.tar.gz)
sha256sums=('ce62e82c0e3e9688767a11a94714a2640dcd20fd54d9974916c3ba4e29bd2863')

build() {
  cd "$srcdir"

  msg2 'Building...'
  ./package/compile
}

package() {
  cd "$srcdir"

  msg2 'Installing license...'
  install -Dm 644 source/COPYING -t "$pkgdir/usr/share/licenses/redo"

  msg2 'Installing...'
  ./package/export "$pkgdir/usr/"
}

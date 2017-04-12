# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=redo-jdebp
pkgver=1.3
pkgrel=1
pkgdesc="An implementation of Bernstein's redo proposal"
arch=('i686' 'x86_64')
makedepends=('perl')
url="https://jdebp.eu/Softwares/redo"
license=('custom:ISC')
source=(https://jdebp.eu/Repository/freebsd/${pkgname%-jdebp}-$pkgver.tar.gz)
sha256sums=('191cc99f24c450710fe4ea6dd2bea4a6ed6afab2eb870c4d0232009d4ab3a7fb')
provides=('redo')
conflicts=('redo')

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

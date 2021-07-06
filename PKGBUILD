# Maintainer: buckket <buckket@cock.li>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=redo-jdebp
pkgver=1.4
pkgrel=2
pkgdesc="An implementation of Bernstein's redo proposal"
arch=('i686' 'x86_64')
makedepends=('perl')
url="https://jdebp.eu/Softwares/redo"
license=('custom:ISC')
source=(http://jdebp.info/Repository/freebsd/${pkgname%-jdebp}-$pkgver.tar.gz)
sha256sums=('5b9289f1228eee2f22ab96f7dd4f9b43e3a6d24f75c1f9d1e18eec7360c90fb1')
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

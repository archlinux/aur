# Maintainer: Denis Kasak <dkasak|AT|termina.org.uk>
# Contributor: Hilton Medeiros <medeiros.hilton at gmail tod com>
# Contributor: Tony Dodd <arch@recalcitrance.net>
# Contributor: Mark Taylor <skymt0@gmail.com>

pkgname=contextfree
pkgver=3.0.8
pkgrel=1
pkgdesc="A program that generates images from written instructions called a grammar"
arch=('i686' 'x86_64')
url="http://www.contextfreeart.org/"
license=('GPL2')
depends=('libpng' 'gcc-libs')
makedepends=('bison' 'flex')
source=("http://www.contextfreeart.org/download/ContextFreeSource${pkgver}.tgz")
md5sums=('f1c83909e1cc54c54067b77d977b83d7')

build() {
  cd "$srcdir/ContextFreeSource$pkgver"
  make
}

package() {
  cd "$srcdir/ContextFreeSource$pkgver"
  install -Dm755 cfdg "$pkgdir/usr/bin/cfdg"
  install -d "$pkgdir/usr/share/$pkgname"
  cp -r input "$pkgdir/usr/share/$pkgname/examples"
}

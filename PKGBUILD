# Maintainer: Denis Kasak <dkasak|AT|termina.org.uk>
# Contributor: Hilton Medeiros <medeiros.hilton at gmail tod com>
# Contributor: Tony Dodd <arch@recalcitrance.net>
# Contributor: Mark Taylor <skymt0@gmail.com>

pkgname=contextfree
pkgver=3.0.9
pkgrel=1
pkgdesc="A program that generates images from written instructions called a grammar"
arch=('i686' 'x86_64')
url="https://www.contextfreeart.org/"
license=('GPL2')
depends=('libpng' 'gcc-libs')
makedepends=('bison' 'flex')
source=("https://www.contextfreeart.org/download/ContextFreeSource${pkgver}.tgz")
md5sums=('8d1e2b20e105138aab44bbe157b23539')

build() {
  cd "$srcdir/context-free-$pkgver"
  make
}

package() {
  cd "$srcdir/context-free-$pkgver"
  install -Dm755 cfdg "$pkgdir/usr/bin/cfdg"
  install -d "$pkgdir/usr/share/$pkgname"
  cp -r input "$pkgdir/usr/share/$pkgname/examples"
}

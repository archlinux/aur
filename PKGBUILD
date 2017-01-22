# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

pkgname=ng-jackspa
pkgver=1.0
pkgrel=1
pkgdesc="A set LADSPA plugin hosts for JACK with several graphical and terminal user interfaces"
arch=('i686' 'x86_64')
url="https://gna.org/projects/ngjackspa"
license=('GPL2')
depends=('gtkmm' 'jack' 'qt4')
makedepends=('gdb' 'ladspa')
source=("http://download.gna.org/ngjackspa/ngjackspa-1.0.tar.gz")
md5sums=('dd058a35e1355b483a10e9a33abed53f')

build() {
  cd "$srcdir/ngjackspa-$pkgver"

  make QMAKE="qmake-qt4" prefix=/usr
}

package() {
  cd "$srcdir/ngjackspa-$pkgver"

  make prefix=/usr DESTDIR="$pkgdir" install install-doc
}

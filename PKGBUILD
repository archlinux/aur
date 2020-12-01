# Maintainer: Hans Ole Hatzel <hhatzel	ät gmail.com>

pkgname=sfst
_srcname=SFST
pkgver='1.4.7e'
pkgrel=2
pkgdesc='Toolbox for the implementation of morphological analyzers and other tools.'
arch=('i686' 'x86_64')
url="https://www.cis.uni-muenchen.de/~schmid/tools/SFST/"
license=('GPL2')
depends=()
makedepends=('bison' 'flex' 'ncurses' 'm4')
source=('https://www.cis.uni-muenchen.de/~schmid/tools/SFST/data/SFST-1.4.7e.tar.gz')
sha256sums=('4c5de5ace89cb564acd74224074bbb32a72c8cf744dc8ef565971da3f22299e4')


build() {
  cd ${_srcname}/src

  make
}

package() {
  cd ${_srcname}/src

  make DESTDIR="$pkgdir/usr/" install
  make DESTDIR="$pkgdir/usr/share/" maninstall
}

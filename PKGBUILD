# Maintainer: Ner0

pkgname=qxkb
pkgver=0.4.6
pkgrel=2
arch=('i686' 'x86_64')
pkgdesc="Keyboard layout switcher (the further development of axkb)"
url="http://code.google.com/p/qxkb/"
license=('GPL3')
depends=('libxkbfile' 'qt4')
makedepends=('cmake')
source=("http://qxkb.googlecode.com/files/$pkgname-$pkgver.tar.bz2")
md5sums=('a2483765fc24e70bca4e079974861d39')

build() {
  cd $pkgname-$pkgver
  mkdir build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr
}

package() {
  cd $pkgname-$pkgver/build
  make DESTDIR="$pkgdir/" install
}

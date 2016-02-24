# Maintainer: itsme <mymail@ishere.ru>

pkgname=qxkb
pkgver=0.4.6
pkgrel=3
arch=('i686' 'x86_64')
pkgdesc="Keyboard layout switcher (the further development of axkb)"
url="https://github.com/disels/qxkb"
license=('GPL2')
depends=('libxkbfile' 'qt4')
makedepends=('cmake')
source=("https://github.com/disels/qxkb/archive/$pkgname-$pkgver.tar.gz")
md5sums=('83d7d8d20f6e3bb22283ce473e75cab6')

build() {
  cd $pkgname-$pkgname-$pkgver
  mkdir build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr
}

package() {
  cd $pkgname-$pkgname-$pkgver/build
  make DESTDIR="$pkgdir/" install
}

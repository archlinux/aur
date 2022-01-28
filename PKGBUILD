# Maintainer: thegala <thegala@disroot.org>
# Contributor: itsme <mymail@ishere.ru>

_pkgname=qxkb
pkgname=qxkb-qt5
pkgver=0.5.2
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Keyboard layout switcher (the further development of axkb). Qt5 version."
url="https://github.com/thegala/qxkb"
license=('GPL2')
depends=('libxkbfile' 'qt5-base' 'qt5-svg' 'qt5-x11extras')
makedepends=('cmake' 'qt5-tools')
source=("https://github.com/thegala/qxkb/archive/$_pkgname-$pkgver.tar.gz")
md5sums=('c095e2ecc2ea3f737de7eeffdb9c29e8')
provides=('qxkb')
conflicts=('qxkb')

build() {
  cd $_pkgname-$_pkgname-$pkgver
  mkdir -p build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr
}

package() {
  cd $_pkgname-$_pkgname-$pkgver/build
  make DESTDIR="$pkgdir/" install
}

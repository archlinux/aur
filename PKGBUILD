# Maintainer:geekmar
pkgname=panda-launcher-git
pkgver=1.0
_commit=1d959b400cb9f2156db2cab9dbdeda831b3326db
pkgrel=1
pkgdesc="launcher for PandaOS"
arch=(x86_64)
url="https://github.com/pandaos/panda-launcher"
license=('GPL3')
depends=('kwindowsystem' 'qt5-x11extras' 'qt5-svg')
makedepends=('extra-cmake-modules' 'qt5-tools')
source=("$pkgname-$_commit.tar.gz::https://github.com/pandaos/panda-launcher/archive/$_commit.tar.gz")
sha512sums=('2633f767ac5422be55c560673c4f2b2c26d80b77d0b635771711cdac7043320abfea37ffe21fdcc667037951a9a501a0e12f15ebf668fdfb770f13613b2c5b95')


build() {
  cd panda-launcher-$_commit
  cmake . -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib
  make
}

package() {
  cd panda-launcher-$_commit
  make DESTDIR="$pkgdir" install
}

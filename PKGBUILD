# Maintainer: Reven Martin <revenmartin@gmail.com>

pkgname=panda-launcher
pkgver=0.0.0.WTF
_commit=98152e4c11f8b4e0784abe157c8f3bcad4791d78
pkgrel=1
pkgdesc="launcher for PandaDE"
arch=(x86_64)
url="https://github.com/pandaos/panda-launcher"
license=('GPL3')
depends=('kwindowsystem' 'qt5-x11extras' 'qt5-svg')
makedepends=('extra-cmake-modules' 'qt5-tools')
source=("$pkgname-$_commit.tar.gz::https://github.com/pandaos/panda-launcher/archive/$_commit.tar.gz")
sha512sums=('018b25cadfb4b3df98d3d8d9ac1c658bcb64b575cebdf6df08d0ea7023e7c120f4028b1b35f796507d828da6a384f117ff46228ad0d7871d02a28bf67a781b0c')

build() {
  cd panda-launcher-$_commit
  cmake . -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib
  make
}

package() {
  cd panda-launcher-$_commit
  make DESTDIR="$pkgdir" install
}

# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Len Zhang <zyldragoon@gmail.com>

pkgname=appmenu-qt4
pkgver=0.2.6
pkgrel=2
pkgdesc="Export Qt4 applications menus over D-Bus"
arch=(x86_64)
url="https://launchpad.net/appmenu-qt"
license=(GPL)
depends=(libdbusmenu-qt4)
makedepends=(cmake)
conflicts=(appmenu-qt)
replaces=(appmenu-qt)
source=("https://launchpad.net/appmenu-qt/trunk/$pkgver/+download/appmenu-qt-$pkgver.tar.bz2")
sha256sums=('21dd0357edeef1b20a5b56c91f1f423fdef65c81d082a22d8fe5761810927ddb')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../appmenu-qt-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE="Release"
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}

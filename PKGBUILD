# Maintainer: justforlxz <justforlxz@gmail.com>

pkgname=dwayland-reborn
_pkgname=dwayland
pkgver=5.24.3
_tag=5.24.3-deepin.1.4
pkgrel=2
pkgdesc='Qt-style Client and Server library wrapper for the Wayland libraries'
arch=(x86_64)
license=(LGPL)
depends=(qt5-wayland)
makedepends=(extra-cmake-modules doxygen qt5-tools qt5-doc wayland-protocols deepin-wayland-protocols-reborn ninja)
source=(https://github.com/justforlxz/dwayland/archive/refs/tags/$_tag.tar.gz)
sha256sums=('1216e62e57fcf0d3634fbad34d56e188626947f667e327e3c9165a9cec449eae')
options=(debug)

build() {
  cmake -G Ninja -B build -S $_pkgname-$_tag \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

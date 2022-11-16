# Maintainer: justforlxz <justforlxz@gmail.com>

pkgname=dwayland-reborn
_pkgname=dwayland
pkgver=5.24.3
_tag=5.24.3-deepin.1.3
pkgrel=1
pkgdesc='Qt-style Client and Server library wrapper for the Wayland libraries'
arch=(x86_64)
license=(LGPL)
depends=(qt5-wayland)
makedepends=(extra-cmake-modules doxygen qt5-tools qt5-doc wayland-protocols deepin-wayland-protocols-reborn)
source=(https://github.com/justforlxz/dwayland/archive/refs/tags/$_tag.tar.gz)
sha256sums=('898e0679fdcbb9c5b7276b1e39f823437f26234b57dcdab0126d18caca9af079')
options=(debug)

build() {
  cmake -B build -S $_pkgname-$_tag \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

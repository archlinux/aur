# Maintainer: Korvin Roganov <korvinagor@vivaldi.net>

pkgname=(phonon-qt5-mpv)
pkgdesc="Phonon MPV backend for Qt5"
pkgver=0.0.2
pkgrel=1
arch=(x86_64)
url='https://github.com/OpenProgger/phonon-mpv'
license=(LGPL)
depends=(mpv phonon-qt5)
provides=(phonon-qt5-backend)
makedepends=(extra-cmake-modules)
source=("https://github.com/OpenProgger/phonon-mpv/archive/v$pkgver.tar.gz")
sha256sums=('429e5eceee01161a5d20063a443f0d7b025c97e68d3bf44ee6851cb46d95104e')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../phonon-mpv-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_SKIP_RPATH=ON \
    -DCMAKE_INSTALL_LIBDIR=lib
  make
}

package_phonon-qt5-mpv() {
  cd build
  make DESTDIR="$pkgdir" install
}

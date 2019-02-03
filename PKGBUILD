# Maintainer: Korvin Roganov <korvinagor@vivaldi.net>

pkgname=(phonon-qt5-mpv)
pkgdesc="Phonon MPV backend for Qt5"
pkgver=0.0.3
pkgrel=1
arch=(x86_64)
url='https://github.com/OpenProgger/phonon-mpv'
license=(LGPL)
depends=(mpv phonon-qt5)
provides=(phonon-qt5-backend)
makedepends=(extra-cmake-modules)
source=("https://github.com/OpenProgger/phonon-mpv/archive/v$pkgver.tar.gz")
sha256sums=('05558ffecba6e684e77281681f33a92b6965c23378587fff017792adaed82321')

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

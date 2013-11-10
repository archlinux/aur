# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=phonon-gstreamer
pkgver=4.7.0
pkgrel=2
arch=('i686' 'x86_64')
url='http://phonon.kde.org/'
pkgdesc="Phonon GStreamer backend"
license=('LGPL')
depends=('gstreamer0.10-base-plugins')
makedepends=('cmake' 'automoc4' 'phonon-qt4')
provides=('phonon-backend')
install="${pkgname}.install"
source=("http://download.kde.org/stable/phonon/phonon-backend-gstreamer/${pkgver}/src/phonon-backend-gstreamer-${pkgver}.tar.xz")
md5sums=('f00a1529d43158ce9faea516814562d3')

prepare() {
  mkdir build
}

build() {
  cd build
  cmake ../phonon-backend-gstreamer-${pkgver} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_SKIP_RPATH=ON \
    -DCMAKE_INSTALL_LIBDIR=lib
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}

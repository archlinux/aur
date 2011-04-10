# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=phonon-gstreamer
pkgver=4.5.0
pkgrel=1
arch=('i686' 'x86_64')
url="http://phonon.kde.org"
pkgdesc="Phonon GStreamer backend"
license=('LGPL')
depends=('gstreamer0.10-base-plugins')
makedepends=('cmake' 'automoc4' 'phonon' 'mesa')
provides=('phonon-backend')
source=("http://download.kde.org/stable/phonon/phonon-backend-gstreamer/${pkgver}/src/phonon-backend-gstreamer-${pkgver}.tar.bz2")
md5sums=('2875139f2b7b649396125f4acc66de67')

build() {
  cd ${srcdir}
  mkdir build
  cd build
  cmake ../phonon-backend-gstreamer-${pkgver} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd ${srcdir}/build
  make DESTDIR=${pkgdir} install
}

# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=phonon-gstreamer
pkgver=4.6.0
pkgrel=1
arch=('i686' 'x86_64')
url='http://phonon.kde.org/'
pkgdesc="Phonon GStreamer backend"
license=('LGPL')
depends=('gstreamer0.10-base-plugins')
makedepends=('cmake' 'automoc4' 'phonon' 'mesa')
provides=('phonon-backend')
install="${pkgname}.install"
source=("http://download.kde.org/stable/phonon/phonon-backend-gstreamer/${pkgver}/src/phonon-backend-gstreamer-${pkgver}.tar.xz")
md5sums=('cc380c7612aaaa87294185ded702f88a')

build() {
  cd "${srcdir}"
  mkdir build
  cd build
  cmake ../phonon-backend-gstreamer-${pkgver} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_SKIP_RPATH=ON
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}" install
}

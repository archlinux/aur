# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=phonon-gstreamer
pkgver=4.6.3
pkgrel=1
arch=('i686' 'x86_64')
url='http://phonon.kde.org/'
pkgdesc="Phonon GStreamer backend"
license=('LGPL')
depends=('gstreamer0.10-base-plugins')
makedepends=('cmake' 'automoc4' 'phonon')
provides=('phonon-backend')
install="${pkgname}.install"
source=("http://download.kde.org/stable/phonon/phonon-backend-gstreamer/${pkgver}/src/phonon-backend-gstreamer-${pkgver}.tar.xz")
md5sums=('d7b0b6245f380347c52c09033a814931')

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

# Maintainer: spider-mario <spidermario@free.fr>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: laloch <laloch@atlas.cz>

pkgname=qt5-gstreamer
pkgver=1.2.0
pkgrel=1
pkgdesc="Qt5 bindings for GStreamer"
arch=('i686' 'x86_64')
url='http://gstreamer.freedesktop.org/modules/qt-gstreamer.html'
license=('LGPL2.1')
depends=('qt5-declarative' 'gst-plugins-good')
makedepends=('cmake' 'boost' 'mesa' 'doxygen')
source=("http://gstreamer.freedesktop.org/src/qt-gstreamer/qt-gstreamer-${pkgver}.tar.xz")
md5sums=('fd794045a828c184acc1794b08a463fd')

prepare() {
  mkdir build
}

build() {
  cd build
  cmake ../qt-gstreamer-${pkgver} \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DQTGSTREAMER_EXAMPLES=OFF \
    -DQT_VERSION=5
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}

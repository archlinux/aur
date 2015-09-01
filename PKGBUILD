# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=baloo4-widgets
pkgver=4.14.3
pkgrel=2
pkgdesc="Widgets for Baloo"
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/kde/kdelibs/baloo-widgets'
license=('LGPL')
depends=('libbaloo4')
makedepends=('cmake' 'automoc4')
conflicts=('baloo-widgets')
replaces=('baloo-widgets')
source=("http://download.kde.org/stable/${pkgver}/src/baloo-widgets-${pkgver}.tar.xz")
sha1sums=('f710e430879cbee44bda393f0feca53ec1b4ab3a')

prepare() {
  mkdir build
}

build() {
  cd build
  cmake ../baloo-widgets-${pkgver} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}

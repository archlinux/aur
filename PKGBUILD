# Maintainer: FadeMind <fademind@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

_pkgname=libkomparediff2
pkgname=libkomparediff2-kde4
pkgver=14.12.3
pkgrel=1
pkgdesc="Library to compare files and strings"
url='https://projects.kde.org/projects/kde/kdesdk/libkomparediff2'
arch=('i686' 'x86_64')
license=('GPL' 'LGPL' 'FDL')
depends=('kdelibs')
makedepends=('cmake' 'automoc4')
conflicts='libkomparediff2'
source=("http://download.kde.org/stable/applications/${pkgver}/src/${_pkgname}-${pkgver}.tar.xz")
sha1sums=('feaec85030e653a77fae0ca5d5cf70956be81475')

prepare() {
  mkdir build
}

build() {
  cd build
  cmake ../${_pkgname}-${pkgver} \
    -DCMAKE_BUILD_TYPE=Release \
    -DKDE4_BUILD_TESTS=OFF \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}

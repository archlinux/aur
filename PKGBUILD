# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=libkcompactdisc
pkgver=4.9.0
pkgrel=1
pkgdesc="A library for interfacing with CDs"
url='https://projects.kde.org/projects/kde/kdemultimedia/libkcompactdisc'
arch=('i686' 'x86_64')
license=('GPL' 'LGPL' 'FDL')
depends=('kdelibs')
makedepends=('cmake' 'automoc4')
replaces=('kdemultimedia-kioslave')
conflicts=('kdemultimedia-kioslave')
source=("http://download.kde.org/stable/${pkgver}/src/${pkgname}-${pkgver}.tar.xz")
sha1sums=('70c10ce02960c8eb00cb126471831a50b7d6262e')

build() {
  cd "${srcdir}"
  mkdir build
  cd build
  cmake ../${pkgname}-${pkgver} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${srcdir}"/build
  make DESTDIR="${pkgdir}" install
}

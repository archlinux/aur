# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=libkcompactdisc
pkgver=14.12.1
pkgrel=1
pkgdesc="A library for interfacing with CDs"
url='https://projects.kde.org/projects/kde/kdemultimedia/libkcompactdisc'
arch=('i686' 'x86_64')
license=('GPL' 'LGPL' 'FDL')
depends=('kdelibs')
makedepends=('cmake' 'automoc4')
replaces=('kdemultimedia-kioslave')
conflicts=('kdemultimedia-kioslave')
source=("http://download.kde.org/stable/applications/${pkgver}/src/${pkgname}-${pkgver}.tar.xz")
sha1sums=('75be7a25cdc20d9c9a7711e28b50d8e6dc18e27c')

build() {
  cd "${srcdir}"
  mkdir build
  cd build
  cmake ../${pkgname}-${pkgver} \
    -DCMAKE_BUILD_TYPE=Release \
    -DKDE4_BUILD_TESTS=OFF \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${srcdir}"/build
  make DESTDIR="${pkgdir}" install
}

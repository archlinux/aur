# Maintainer: Matthias Fulz <mfulz@olznet.de>

pkgname=libexmdbpp
pkgver=1.11
pkgrel=1
pkgdesc='C++ implementation of the exmdb wire protocol'
groups=('grommunio')
arch=('x86_64')
url='https://grommunio.com'
license=('AGPLv3')
makedepends=('autoconf' 'cmake' 'gcc' 'pybind11')
source=("https://github.com/grommunio/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('c4be089165e439d8f9408c5fdba8aca05ea6a861d6be134850a8d339ab8aac0f')

build() {
  cmake \
    -B build \
    -S "${pkgname}-${pkgver}" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=/usr/lib/ \
    -DCMAKE_BUILD_TYPE=Release

  cmake --build build
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}

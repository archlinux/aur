# Maintainer: Javier Tiá <javier.tia at gmail dot com>

pkgname=doctest
pkgver=1.2.9
pkgrel=1
pkgdesc='The lightest feature rich C++ single header testing framework'
arch=('i686' 'x86_64')
url='https://github.com/onqtam/doctest'
license=('MIT')
makedepends=('cmake' 'sed')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('24a08fb246959c3d254c833c731102cbecf38528e5abf66e4ecc2dba1e156a2c')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir build
  cd build
  cmake -DCMAKE_BUILD_TYPE=Release ../
}

# check() {
  # cd "${srcdir}/${pkgname}-${pkgver}/build"
  # make
  # ctest -C Release --output-on-failure
# }

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm 0644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 0644 doctest/doctest.h "${pkgdir}/usr/include/doctest.h"
}

# vim:set ft=sh ts=2 sw=2 et:

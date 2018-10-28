# Maintainer: Javier Tiá <javier.tia at gmail dot com>

pkgname=doctest
pkgver=2.0.1
pkgrel=1
pkgdesc='The lightest feature rich C++ single header testing framework'
arch=('i686' 'x86_64')
url='https://github.com/onqtam/doctest'
license=('MIT')
makedepends=('cmake' 'sed')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('66e93ed13a567e5aebb8f431a4fb5fc6b85ffe3f31a9fb84a95f974ba1c7161b')

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

# vim:set ts=2 sw=2 et:

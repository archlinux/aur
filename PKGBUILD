# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Amr Hassan <amr.hassan@gmail.com>

pkgname=utf8cpp
pkgver=3.1
pkgrel=2
pkgdesc="UTF-8 with C++ in a Portable Way"
url='http://utfcpp.sourceforge.net'
arch=('any')
license=('Custom')
makedepends=('cmake')
source=("https://github.com/nemtrif/utfcpp/archive/v${pkgver}.tar.gz")
sha256sums=('ab531c3fd5d275150430bfaca01d7d15e017a188183be932322f2f651506b096')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake "../utfcpp-${pkgver}" \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DUTF8_TESTS=OFF

  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}

# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=pugixml
pkgver=1.7
pkgrel=2
pkgdesc="Light-weight, simple and fast XML parser for C++ with XPath support"
url='http://pugixml.org'
arch=('x86_64' 'i686' 'armv7h')
license=('MIT')
makedepends=('cmake')
source=("http://github.com/zeux/pugixml/releases/download/v${pkgver}/pugixml-${pkgver}.tar.gz")
sha1sums=('b32212efbae781a1830711798aabbc2974c8c552')


prepare() {
  mkdir -p build
}

build() {
  cd build

  cmake "../pugixml-${pkgver}/scripts" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DBUILD_SHARED_LIBS=ON
  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}

pkgname=pugixml
pkgver=1.6
pkgrel=1
pkgdesc="Light-weight, simple and fast XML parser for C++ with XPath support"
url='http://pugixml.org'
arch=('x86_64' 'i686')
license=('MIT')
makedepends=('cmake')
conflicts=('pugixml')
provides=('pugixml')
source=("http://github.com/zeux/pugixml/releases/download/v${pkgver}/pugixml-${pkgver}.tar.gz")
sha1sums=('0c22fc238b209c9fd1802b74927f0b1e9f68011c')

prepare() {
  mkdir -p build
}

build() {
  cd build

  cmake "../pugixml-${pkgver}/scripts" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DBUILD_SHARED_LIBS=ON
  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}

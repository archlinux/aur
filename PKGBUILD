# Maintainer: Moritz Kiefer <moritz.kiefer@purelyfunctional.org>
pkgname=libcbor
pkgver=0.4.0
pkgrel=1
pkgdesc="A C library for parsing and generating CBOR, the general-purpose schema-less binary data format."
arch=('i686' 'x86_64')
url="https://github.com/PJK/libcbor"
license=('GPL')
depends=()
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/PJK/libcbor/archive/v0.4.0.tar.gz")
sha256sums=('1b61e6eba2b5b18b5ec1a29161ad7037689464e77a4ad6cc1c084f888b531acf')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
  make cbor cbor_shared
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"

  make DESTDIR="${pkgdir}/" install
}

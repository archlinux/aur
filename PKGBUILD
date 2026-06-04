# Maintainer: Isaías Rodríguez <isurwars@gmail.com>
pkgname=correlation
pkgver=3.2.1
pkgrel=1
pkgdesc="Analysis tool for liquid and amorphous solid structures"
arch=('x86_64')
url="https://github.com/Isurwars/Correlation"
license=('MIT')
depends=('intel-oneapi-tbb' 'hdf5' 'fontconfig' 'freetype2' 'libxcb')
makedepends=('cmake' 'ninja' 'rust' 'pkgconf')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('1c06a88f8c557c778b94a388346b56e01c7e3f2731bc6da622425d46895ca8b3')

prepare() {
  cmake -B build -S "Correlation-${pkgver}" \
    -DCMAKE_BUILD_TYPE=Release \
    -G Ninja
}

build() {
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}

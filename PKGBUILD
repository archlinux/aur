# Maintainer:
# Contributor: James P. Harvey <jamespharvey20 at gmail dot com>

pkgname=libcelero
pkgver=2.8.5
pkgrel=1
pkgdesc="C++ benchmark authoring library/framework"
arch=('i686' 'x86_64')
url="https://github.com/DigitalInBlue/Celero"
license=('Apache-2.0')
depends=('gcc-libs' 'glibc')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('1f319661c4bee1f6855e45c1764be6cd38bfe27e8afa8da1ad7060c1a793aa20')

build() {
  cmake -B build -S "Celero-${pkgver}" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}

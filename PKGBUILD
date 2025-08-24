# Maintainer: Kilian "CaféHaine" GUILLAUME <kilian.guillaume@gmail.com>

pkgname=psp2cxml-tool
pkgver=1.3
pkgrel=1
pkgdesc='A tool for compiling xml files to cxml/rco/rcs format'
url='https://github.com/Princess-of-Sleeping/psp2cxml-tool'
arch=(x86_64)
license=('GPL-3.0')
depends=()
makedepends=(
  cmake
)
options=()
source=("${pkgname}-${pkgver}::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('7a38f875c12052dcd9938f04969e874ccdaf7446b8c807a896c1fb3d3dd380c5')

build() {
  cd "${pkgname}-${pkgver}"
  mkdir -p build
  cd build
  cmake .. -DCMAKE_POLICY_VERSION_MINIMUM=3.5
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  mkdir -p "$pkgdir"/usr/bin
  install build/psp2cxml-tool "$pkgdir"/usr/bin/
}

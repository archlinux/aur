# Maintainer: gee
# contributors: yochananmarqos, bpierre, PedroHLC, rodrigo21
pkgname='gitklient'
pkgver=0.1
pkgrel=1
pkgdesc='Git gui client for KDE'
arch=('x86_64')
url='https://github.com/HamedMasafi/GitKlient'
license=('GPL3')
makedepends=('cmake' 'extra-cmake-modules' 'qt5-base' 'ktexteditor' 'kdoctools')
#makedepends=('meson' 'ninja' 'glslang' 'libx11' 'spirv-headers' 'vulkan-headers')
depends=('qt5-base' 'ktexteditor' 'kdoctools')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d601b046e3868932fa3746e4ac05faf4fb984e73415fd98fc20ab4ec68649fe8')

build() {
  rm build -rf
  mkdir build
  cd build
  cmake ../GitKlient-${pkgver}
  make
}

package() {
  make DESTDIR="${pkgdir}" -C build install
}

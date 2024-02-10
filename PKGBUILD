# Maintainer: Andrew O'Neill <andrew at haunted dot sh>

pkgname=satdump
pkgver=1.1.3
pkgrel=1
pkgdesc='A generic satellite processing software'
arch=('x86_64')
license=('GPL-3.0-only')
url='https://github.com/altillimity/SatDump'
depends=('airspy' 'fftw' 'glfw' 'hackrf' 'libad9361' 'libpng' 'libvolk' 'nng' 'ocl-icd' 'portaudio' 'rtl-sdr' 'zstd')
makedepends=('boost' 'cmake' 'jemalloc' 'opencl-headers')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
optdepends=('limesuite' 'bladerf')
sha256sums=('7abbfb3f1fdd89ac2e2fc7883c9680c26f8426ac6e8ff60b3765f64b1ff2cd46')

build() {
  cd "SatDump-${pkgver}"

  mkdir build
  cd build
  cmake -DCMAKE_BUILD_TYPE=Release ..
  make
}

package() {
  cd "SatDump-${pkgver}/build"

  make DESTDIR="${pkgdir}" install
}

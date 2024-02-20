# Maintainer: Andrew O'Neill <andrew at haunted dot sh>

pkgname=satdump
pkgver=1.1.4
pkgrel=1
pkgdesc='A generic satellite processing software'
arch=('x86_64')
license=('GPL-3.0-only')
url='https://github.com/altillimity/SatDump'
depends=('airspy' 'fftw' 'glfw' 'hackrf' 'jemalloc' 'libad9361' 'libpng' 'libvolk' 'nng' 'ocl-icd' 'portaudio' 'rtl-sdr' 'zstd')
makedepends=('boost' 'cmake' 'opencl-headers')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
optdepends=('limesuite' 'bladerf')
sha256sums=('ae466e8205de8848b2c57b74b7fdd1baf07ddd4fcafa14296a86e48ffb945d77')

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

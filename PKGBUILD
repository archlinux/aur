# Maintainer: chn <g897331845@gmail.com>
pkgname=xtensor-fftw
pkgver=0.2.6
pkgrel=1
pkgdesc="FFTW bindings for the xtensor C++14 multi-dimensional array library"
arch=('any')
url="https://github.com/xtensor-stack/xtensor-fftw"
license=('BSD-3-Clause')
depends=('xtensor' 'xtl' 'fftw>=3')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/xtensor-stack/xtensor-fftw/archive/${pkgver}.tar.gz")

build() {
	cd "${pkgname}-${pkgver}"
  mkdir -p build
  cd build
  cmake \
    -DCMAKE_INSTALL_PREFIX=${pkgdir}/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    ..
  make
}

package() {
	cd "${pkgname}-${pkgver}/build"
  make install
}
sha512sums=('278676eb92767677622bac961b65be599804ea86eba4df4cd72f237f9c9f8f2d20b7daec045bde6c09d7c72e29f5c5e01e6abda7350ac706543f34434c8d40f2')

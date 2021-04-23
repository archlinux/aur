# Maintainer: chn <g897331845@gmail.com>
pkgname=xtensor-fftw
pkgver=0.2.3
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
sha512sums=('db947fd162a88b716ff85dadf58d2fcb82d1ffc058b1484322d9978d9c74d68209e0b9e626238027b01e8bb0b45bf221365c2d8319acdb3361c65471322ee3d9')

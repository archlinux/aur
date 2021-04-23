# Maintainer: chn <g897331845@gmail.com>
pkgname=xtensor-io
pkgver=0.12.6
pkgrel=1
pkgdesc="xtensor plugin to read and write images, audio files, numpy (compressed) npz and HDF5"
arch=('any')
url="https://github.com/xtensor-stack/xtensor-io"
license=('BSD-3-Clause')
depends=('xtensor' 'openimageio' 'libsndfile' 'zlib' 'blosc' 'gdal')
makedepends=('cmake')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/xtensor-stack/xtensor-io/archive/${pkgver}.tar.gz")

build() {
	cd "${pkgname}-${pkgver}"
  mkdir -p build
  cd build
  cmake \
    -DCMAKE_INSTALL_PREFIX=${pkgdir}/usr \
    -DHAVE_OIIO=ON \
    -DHAVE_SndFile=ON \
    -DHAVE_ZLIB=ON \
    -DHAVE_Blosc=ON \
    -DHAVE_GDAL=ON \
    ..
  make
}

package() {
	cd "${pkgname}-${pkgver}/build"
  make install
}

sha512sums=('b73f180097540da998ff9b6974050e335d7c4e33c3c46c0f3abdedffc44eb59ba6cdba1508885a71e7749f3bc3a9ff1499e105332dff5e2b5e23e2e96e542924')

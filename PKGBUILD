# Maintainer: Simone Gaiarin <simgunz@gmail.com>
# Contributor: Simone Gaiarin <simgunz@gmail.com>

pkgname=fnft
pkgver=0.4.1
pkgrel=1
pkgdesc="A library for fast numerical computation of (inverse) nonlinear Fourier transforms"
arch=('any')
url="https://github.com/FastNFT/FNFT"
license=('GPL2')
makedepends=('gcc' 'gcc-fortran' 'cmake')
source=("https://github.com/FastNFT/FNFT/archive/v${pkgver}.tar.gz")
sha1sums=('bc3c5be0d0546f4bf22ac41e6d105601f924dff4')

build() {

  mkdir -p "${srcdir}/build"
  cd "${srcdir}/build"
  cmake ${srcdir}/FNFT-${pkgver} -DENABLE_FFTW=ON -DBUILD_TESTS=OFF
  make -j4
}

package() {
  cd ${srcdir}/build
  make DESTDIR="$pkgdir/" install
}

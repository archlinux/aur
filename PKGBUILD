# Maintainer: Simone Gaiarin <simgunz@gmail.com>
# Contributor: Simone Gaiarin <simgunz@gmail.com>

pkgname=fnft
pkgver=0.2.2
pkgrel=1
pkgdesc="Fast numerical computation of (inverse) nonlinear Fourier transforms"
arch=('any')
url="https://github.com/FastNFT/FNFT"
license=('GPL2')
makedepends=('gcc' 'gcc-fortran' 'cmake')
source=("https://github.com/FastNFT/FNFT/archive/v${pkgver}.tar.gz")
sha1sums=('17aca6985a34f54be2a865554ef863c7d6c3108f')

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

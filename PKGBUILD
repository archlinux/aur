pkgname=superlu_mt
pkgver=4.0.0
pkgrel=1
pkgdesc="Set of subroutines to solve a sparse linear system (multithreading extension)"
arch=('x86_64')
url=""https://github.com/xiaoyeli/superlu_mt
license=('BSD')
depends=('blas')
makedepends=('gcc-fortran')
options=('staticlibs')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('35f8a4c06e791b9f94fdad7a8f2806f4ba76d2c4b9eaaca3882dc13438f9bf67')

build() {
  cd "$srcdir/superlu_mt-${pkgver}"
  cmake -DCMAKE_INSTALL_PREFIX=/usr -Denable_examples=OFF -Denable_tests=OFF -DPLAT="_OPENMP" .
  make
}

package() {
  cd "$srcdir/superlu_mt-${pkgver}"
  make install DESTDIR="${pkgdir}"
}


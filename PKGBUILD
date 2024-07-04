pkgname=superlu_mt
pkgver=4.0.1
pkgrel=1
pkgdesc="Set of subroutines to solve a sparse linear system (multithreading extension)"
arch=('x86_64')
url=""https://github.com/xiaoyeli/superlu_mt
license=('BSD')
depends=('blas')
makedepends=('gcc-fortran' 'cmake')
options=('staticlibs')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b6de5c8ebf8fa6c7c0d607f0607f522454315632ae55b70babf908b94e9602cb')

build() {
  cd "$srcdir/superlu_mt-${pkgver}"
  cmake -DCMAKE_INSTALL_PREFIX=/usr -Denable_examples=OFF -Denable_tests=OFF -DPLAT="_OPENMP" .
  make
}

package() {
  cd "$srcdir/superlu_mt-${pkgver}"
  make install DESTDIR="${pkgdir}"
}


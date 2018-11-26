# Maintainer: Andrew Anderson <andersan@tcd.ie>
pkgname=trinnity
pkgver=0.5
pkgrel=4
pkgdesc="C++ library of CNN primitive operations"
arch=('any')
url="https://bitbucket.org/STG-TCD/trinnity"
license=('BSD')
groups=()
depends=()
makedepends=('doxygen')
checkdepends=()
optdepends=('gsl>=2.3: GSL BLAS backend'
            'atlas-lapack>=3.10.3: ATLAS BLAS backend'
            'openblas-lapack>=0.2.19: OpenBLAS BLAS backend'
            'intel-mkl>=2017.17.0.1.1.132: Intel MKL BLAS backend'
            'clblas>=2.12: clBLAS BLAS backend'
            'cblas: Plain old CBLAS backend'
            'openmp: OpenMP SIMD and SMP Support'
            )
provides=()
conflicts=()
replaces=()
backup=()
options=()
source=("https://bitbucket.org/STG-TCD/trinnity/get/v$pkgver.tar.bz2")

sha512sums=("f7938fd81413e9e69a4154cf29e54f531a38d47ac66a40109366c43ab4fe390b4271eea785795f551b133b11a2c5afc7841d808b120b9ca97ebe0ed137af9f21")

package() {
  make -C $srcdir/STG-* DESTDIR=$pkgdir doc
  make -C $srcdir/STG-* DESTDIR=$pkgdir install
  make -C $srcdir/STG-* DESTDIR=$pkgdir install-arm32
  make -C $srcdir/STG-* DESTDIR=$pkgdir install-arm64
}

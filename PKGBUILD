# Maintainer: Andrew Anderson <andersan@tcd.ie>
pkgname=trinnity-git
_srcname=trinnity
pkgver=0.5
pkgrel=6
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
            'mkl-dnn: OpenMP SIMD and SMP Support, MKLDNN wrapper layers'
            )
provides=()
conflicts=("trinnity")
replaces=()
backup=()
options=()
source=("${_srcname}"::"git+https://bitbucket.org/STG-TCD/${_srcname}")

md5sums=("SKIP")

package() {
  make -C ${srcdir}/* DESTDIR=${pkgdir}/usr doc
  make -C ${srcdir}/* DESTDIR=${pkgdir}/usr install
  make -C ${srcdir}/* DESTDIR=${pkgdir}/usr install-arm32
  make -C ${srcdir}/* DESTDIR=${pkgdir}/usr install-arm64
}

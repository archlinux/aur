# Maintainer: jdarch <jda -dot- cloud -plus- archlinux -at- gmail -dot- com>

pkgname=microsoft-r-open-blas-systemblas
pkgver=3.2.5
pkgrel=1
pkgdesc="Alternative math library symlinks (to the system blas e.g. OpenBLAS) for Microsoft R Open"
arch=('x86_64')
license=('GPL')
url='https://mran.revolutionanalytics.com/open/'
provides=('microsoft-r-open-blas')
conflicts=('microsoft-r-open-blas')
depends=('blas' 'lapack' 'microsoft-r-open')

package() {
  mkdir -p "${pkgdir}/usr/lib/MRO-${pkgver}/R-${pkgver}/lib64/R/lib"
  ln -s "/usr/lib/libblas.so" "${pkgdir}/usr/lib/MRO-${pkgver}/R-${pkgver}/lib64/R/lib/libRblas.so"
  ln -s "/usr/lib/liblapack.so" "${pkgdir}/usr/lib/MRO-${pkgver}/R-${pkgver}/lib64/R/lib/libRlapack.so"
}

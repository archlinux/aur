# Maintainer: jdarch <jda -dot- cloud -plus- archlinux -at- gmail -dot- com>

pkgname=revolution-r-open-blas-systemblas
pkgver=3.2.1
pkgrel=1
pkgdesc="Alternative math library symlinks (to the system blas e.g. OpenBLAS) for Revolution R Open"
arch=('x86_64')
license=('GPL')
url=('http://www.revolutionanalytics.com/revolution-r-open')
provides=('revolution-r-open-blas')
conflicts=('revolution-r-open-blas')
depends=('blas' 'lapack' 'revolution-r-open')

package() {
  mkdir -p "${pkgdir}/usr/lib/RRO-${pkgver}/R-${pkgver}/lib64/R/lib"
  ln -s "/usr/lib/libblas.so" "${pkgdir}/usr/lib/RRO-${pkgver}/R-${pkgver}/lib64/R/lib/libRblas.so"
  ln -s "/usr/lib/liblapack.so" "${pkgdir}/usr/lib/RRO-${pkgver}/R-${pkgver}/lib64/R/lib/libRlapack.so"
}
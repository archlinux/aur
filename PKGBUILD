# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=inline
_cranver=0.3.15
pkgname=r-inline
pkgver=${_cranver//[:-]/.}
pkgrel=2
pkgdesc="Dynamically define R functions & S4 methods with inlined C, C++ or Fortran code"
url="https://cran.r-project.org/web/packages/${_cranname}/index.html"
arch=('x86_64')
license=('LGPL')
depends=('r'
         'gcc-fortran')
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('8f0de494120ecd628fa7a2e6d4af98cb')

package() {
    mkdir -p ${pkgdir}/usr/lib/R/library
    cd "${srcdir}"
    R CMD INSTALL ${_cranname} -l ${pkgdir}/usr/lib/R/library
}

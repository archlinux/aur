# Maintainer: frichtlm <frichtlm@gmail.com>
_cranname=bindrcpp
_cranver=0.2.2
pkgname=r-cran-$_cranname
pkgver=${_cranver}
pkgrel=1
pkgdesc="Provides an easy way to fill an environment with active C++ function bindings."
url="http://cran.r-project.org/web/packages/${_cranname}/index.html"
arch=('i686' 'x86_64')
license=('MIT')
depends=('r' 'r-cran-bindr>=0.1.1' 'r-cran-rcpp>=0.12.16')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('992af2045b0ce4079f62a2cb4b0df767') 

package() {
    mkdir -p ${pkgdir}/usr/lib/R/library
    cd ${srcdir}
    R CMD INSTALL ${_cranname} -l ${pkgdir}/usr/lib/R/library
}

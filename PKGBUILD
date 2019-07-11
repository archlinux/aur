# Maintainer: Taekyung Kim <Taekyung.Kim.Maths@gmail.com>
# Contributor: Ward Segers <w@rdsegers.be>
# Contributor: Alex Branham <branham@utexas.edu>

_cranname=quantreg
_cranver=5.41
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-quantreg
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Quantile Regression"
arch=('x86_64')
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL')
depends=('r>=2.6' 'r-sparsem' 'r-matrixmodels')
makedepends=('gcc-fortran')
optdepends=('r-tripack' 'r-akima' 'r-rgl' 'r-logspline' 'r-nor1mix' 'r-formula' 'r-zoo')
source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('70489defc7f68035e01620b9a3a25238')

build(){
    R CMD INSTALL "${_pkgtar}" -l "$srcdir"
}
package() {
    install -dm0755 "$pkgdir"/usr/lib/R/library
    cp -a --no-preserve=ownership "$_cranname" "$pkgdir"/usr/lib/R/library
}




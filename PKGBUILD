# Maintainer: Taekyung Kim <Taekyung.Kim.Maths@gmail.com>

_cranname=lme4
_cranver=1.1-21
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-lme4
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Linear Mixed-Effects Models using 'Eigen' and S4"
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL2' 'GPL3')
depends=('r>=3.2.0' 'r-minqa>=1.1.15' 'r-nloptr>=1.0.4' 'r-rcpp>=0.10.5' 'r-rcppeigen')
optdepends=('r-knitr' 'r-rmarkdown' 'r-pkpdmodels' 'r-memss' 'r-testthat>=0.8.1' 'r-ggplot2' 'r-mlmrev' 'r-optimx>=2013.8.6' 'r-gamm4' 'r-pbkrtest' 'r-hsaur2' 'r-numderiv' 'r-car' 'r-dfoptim')
source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('80a9e68927bace7c7b45294c506de8b7')

build(){
    R CMD INSTALL "${_pkgtar}" -l "$srcdir"
}
package() {
    install -dm0755 "$pkgdir"/usr/lib/R/library
    cp -a --no-preserve=ownership "$_cranname" "$pkgdir"/usr/lib/R/library
}



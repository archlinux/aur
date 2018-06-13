# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=ModelMetrics
_cranver=1.1.0
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-modelmetrics
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Rapid Calculation of Model Metrics"
arch=('x86_64')
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL')
depends=('r' 'r-rcpp')

optdepends=('r-testthat')

source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('d43175001f0531b8810d2802d76b7b44')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}


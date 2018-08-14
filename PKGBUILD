# Maintainer: Alex Branham <branham@utexas.edu>
_cranver=1.2.0
pkgname=r-modelmetrics
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc='Rapid Calculation of Model Metrics'
arch=('x86_64')
url='https://cran.r-project.org/package=ModelMetrics'
license=('GPL')
depends=('r' 'r-rcpp' 'r-data.table')
optdepends=('r-testthat')
source=("https://cran.r-project.org/src/contrib/ModelMetrics_"$_cranver".tar.gz")
md5sums=('5d75d0f6aa6339c67549d5c1bc0c1727')

build(){
    R CMD INSTALL ModelMetrics_"$_cranver".tar.gz -l "$srcdir"
}
package() {
    install -dm0755 "$pkgdir"/usr/lib/R/library
    cp -a --no-preserve=ownership ModelMetrics "$pkgdir"/usr/lib/R/library
}


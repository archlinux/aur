# Maintainer: Alex Branham <branham@utexas.edu>
_cranver=0.9.100.5.0
pkgname=r-rcpparmadillo
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc='Rcpp Integration for the Armadillo Templated Linear Algebra Library'
arch=('x86_64')
url='https://cran.r-project.org/package=RcppArmadillo'
license=('GPL')
depends=('r' 'r-rcpp>=0.11.0')
optdepends=('r-runit' 'r-pkgkitten' 'r-reticulate' 'r-rmarkdown' 'r-knitr' 'r-pinp' 'r-slam')
source=("https://cran.r-project.org/src/contrib/RcppArmadillo_"$_cranver".tar.gz")
md5sums=('81d5e6c5656a3204adf16683322c5cf2')

build(){
    R CMD INSTALL RcppArmadillo_"$_cranver".tar.gz -l "$srcdir"
}
package() {
    install -dm0755 "$pkgdir"/usr/lib/R/library
    cp -a --no-preserve=ownership RcppArmadillo "$pkgdir"/usr/lib/R/library
}


# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=bayesplot
_cranver=1.5.0
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-bayesplot
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Plotting for Bayesian Models"
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL3')
depends=('r' 'r-dplyr' 'r-ggplot2' 'r-reshape2' 'r-rlang' 'r-ggridges')

optdepends=('pandoc' 'r-arm' 'r-cran-gridextra' 'r-knitr' 'r-loo' 'r-rmarkdown' 'r-rstan' 'r-rstanarm' 'r-rstantools' 'r-cran-scales' 'r-shinystan' 'r-testthat' 'r-vdiffr')

source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('ec21c4e06aa23b4eaa8b52375d2e8854')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}


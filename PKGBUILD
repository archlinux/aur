# Maintainer: Alex Branham <branham@utexas.edu>
_cranver=1.6.0
pkgname=r-bayesplot
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc='Plotting for Bayesian Models'
arch=('any')
url='https://cran.r-project.org/package=bayesplot'
license=('GPL3')
depends=('r' 'r-dplyr>=0.7.1' 'r-ggplot2>=2.2.1' 'r-reshape2' 'r-rlang' 'r-ggridges')
optdepends=('pandoc' 'r-arm' 'r-gridextra' 'r-knitr' 'r-loo' 'r-rmarkdown' 'r-rstan' 'r-rstanarm' 'r-rstantools' 'r-scales' 'r-shinystan' 'r-testthat' 'r-vdiffr')
source=("https://cran.r-project.org/src/contrib/bayesplot_"$_cranver".tar.gz")
md5sums=('da63b1645548d3c6990cc707b871d305')

build(){
    R CMD INSTALL bayesplot_"$_cranver".tar.gz -l "$srcdir"
}
package() {
    install -dm0755 "$pkgdir"/usr/lib/R/library
    cp -a --no-preserve=ownership bayesplot "$pkgdir"/usr/lib/R/library
}


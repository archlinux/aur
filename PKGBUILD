# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=recipes
_cranver=0.1.2
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-recipes
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Preprocessing Tools to Create Design Matrices"
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL2')
depends=('r' 'r-dplyr' 'r-broom' 'r-tibble' 'r-ipred' 'r-dimred>=0.1.0' 'r-lubridate' 'r-timedate' 'r-ddalpha' 'r-purrr' 'r-rlang>=0.1.1' 'r-gower' 'r-rcpproll' 'r-tidyselect>=0.1.1' 'r-magrittr')

optdepends=('r-testthat' 'r-kernlab' 'r-fastica' 'r-rann' 'r-igraph' 'r-knitr' 'r-caret' 'r-ggplot2' 'r-rmarkdown' 'r-covr')

source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('0334c5782560cd6cd8d2e11f2456bdd0')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}


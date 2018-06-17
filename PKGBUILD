# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=recipes
_cranver=0.1.3
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-recipes
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Preprocessing Tools to Create Design Matrices"
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL2')
depends=('r' 'r-dplyr' 'r-broom' 'r-tibble' 'r-ipred' 'r-dimred>=0.1.0' 'r-lubridate' 'r-timedate' 'r-ddalpha' 'r-purrr>=0.2.3' 'r-rlang>=0.1.1' 'r-gower' 'r-rcpproll' 'r-tidyselect>=0.1.1' 'r-magrittr' 'r-tidyr' 'r-pls')

optdepends=('r-testthat' 'r-kernlab' 'r-fastica' 'r-rann' 'r-igraph' 'r-knitr' 'r-rsample' 'r-ggplot2' 'r-rmarkdown' 'r-covr')

source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('0f4a31f7222e7a1bab550ae2d9ea125c')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}


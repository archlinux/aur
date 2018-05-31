# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=blscrapeR
_cranver=3.1.2
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-blscraper
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="An API Wrapper for the Bureau of Labor Statistics (BLS)"
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=('MIT')
depends=('r' 'r-httr' 'r-jsonlite' 'r-ggplot2' 'r-magrittr' 'r-dplyr' 'r-purrr' 'r-tibble' 'r-stringr')

optdepends=('r-testthat' 'r-knitr' 'r-rmarkdown' 'r-tidyverse' 'r-tigris' 'r-leaflet')

source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('0d027c70e2b27dd3e96756f66c4c140b')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}


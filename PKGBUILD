# Maintainer: Alex Branham <branham@utexas.edu>
_cranver=3.1.3
pkgname=r-blscraper
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc='An API Wrapper for the Bureau of Labor Statistics (BLS)'
arch=('any')
url='https://cran.r-project.org/package=blscrapeR'
license=('MIT')
depends=('r' 'r-httr' 'r-jsonlite' 'r-ggplot2' 'r-magrittr' 'r-dplyr' 'r-purrr' 'r-tibble' 'r-stringr')
optdepends=('r-testthat' 'r-knitr' 'r-rmarkdown' 'r-tigris' 'r-leaflet')
source=("https://cran.r-project.org/src/contrib/blscrapeR_"$_cranver".tar.gz")
md5sums=('1f4343668a65c0c1862cc12e909ae10c')

build(){
    R CMD INSTALL blscrapeR_"$_cranver".tar.gz -l "$srcdir"
}
package() {
    install -d "$pkgdir"/usr/lib/R/library
    cp -a --no-preserve=ownership blscrapeR "$pkgdir"/usr/lib/R/library
}


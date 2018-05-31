# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=rvest
_cranver=0.3.2
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-rvest
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Easily Harvest (Scrape) Web Pages"
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL3')
depends=('r' 'r-xml2' 'r-httr' 'r-selectr' 'r-magrittr')

optdepends=('r-testthat' 'r-knitr' 'r-png' 'r-stringi' 'r-rmarkdown' 'r-covr')

source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('78c88740850e375fc5da50d37734d1b2')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}


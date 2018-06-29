# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=googlesheets
_cranver=0.3.0
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-googlesheets
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Manage Google Spreadsheets from R"
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=('MIT')
depends=('r' 'r-cellranger>=1.0.0' 'r-dplyr>=0.4.2' 'r-httr>=1.1.0' 'r-jsonlite' 'r-purrr' 'r-readr>=0.2.2' 'r-stringr' 'r-tibble' 'r-tidyr' 'r-xml2>=1.0.0')
optdepends=('r-covr' 'r-ggplot2' 'r-knitr' 'r-rmarkdown' 'r-rprojroot' 'r-testthat')
source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('6d24aea2117d360ced41649758c62edf')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}


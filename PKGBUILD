# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=tidyverse
_cranver=1.2.1
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-tidyverse
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Easily Install and Load the Tidyverse"
arch=('any')
url="https://cran.r-project.org/web/packages/${_cranname}/index.html"
license=('GPL3' 'custom')
depends=('r' 'r-broom' 'r-cran-cli' 'r-crayon' 'r-dplyr' 'r-dbplyr' 'r-forcats' 'r-ggplot2' 'r-haven' 'r-hms' 'r-httr' 'r-jsonlite' 'r-cran-lubridate' 'r-magrittr' 'r-modelr' 'r-purrr' 'r-readr' 'r-readxl' 'r-reprex' 'r-rlang' 'r-rstudioapi' 'r-rvest' 'r-stringr' 'r-tibble' 'r-tidyr' 'r-xml2')

optdepends=('r-feather' 'r-knitr' 'r-rmarkdown')

source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('7e2ca0b72ab668342c02fd0f52c082e1')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}


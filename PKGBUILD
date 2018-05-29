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
license=('GPL-3 | file LICENSE')
depends=('r' 'r-cran-broom' 'r-cran-cli' 'r-crayon' 'r-cran-dplyr' 'r-dbplyr' 'r-cran-forcats' 'r-cran-ggplot2' 'r-haven' 'r-cran-hms' 'r-httr' 'r-jsonlite' 'r-cran-lubridate' 'r-magrittr' 'r-modelr' 'r-cran-purrr' 'r-cran-readr' 'r-readxl' 'r-reprex' 'r-cran-rlang' 'r-rstudioapi' 'r-rvest' 'r-stringr' 'r-cran-tibble' 'r-cran-tidyr' 'r-xml2')

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


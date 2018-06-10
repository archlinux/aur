# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=tidyverse
_cranver=1.2.1
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-tidyverse
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Easily Install and Load the Tidyverse"
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL3' 'custom')
depends=('r' 'r-broom>=0.4.2' 'r-cran-cli>=1.0.0' 'r-crayon>=1.3.4' 'r-dplyr>=0.7.4' 'r-dbplyr>=1.1.0' 'r-forcats>=0.2.0' 'r-ggplot2>=2.2.1' 'r-haven>=1.1.0' 'r-hms>=0.3' 'r-httr>=1.3.1' 'r-jsonlite>=1.5' 'r-cran-lubridate>=1.7.1' 'r-magrittr>=1.5' 'r-modelr>=0.1.1' 'r-purrr>=0.2.4' 'r-readr>=1.1.1' 'r-readxl>=1.0.0' 'r-reprex>=0.1.1' 'r-rlang>=0.1.4' 'r-rstudioapi>=0.7' 'r-rvest>=0.3.2' 'r-stringr>=1.2.0' 'r-tibble>=1.3.4' 'r-tidyr>=0.7.2' 'r-xml2>=1.1.1')

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


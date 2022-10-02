# Maintainer: Pranav K Anupam <pranavanupam@yahoo.com>
# Contributor: Alex Branham <branham@utexas.edu>
_cranname=tidyverse
_cranver=1.3.2
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-tidyverse
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Easily Install and Load the Tidyverse"
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL3' 'custom')
depends=('r>=3.3' 'r-broom>=0.7.10' 'r-cli>=3.1.0' 'r-crayon>=1.4.2' 'r-dbplyr>=2.1.1' 'r-dplyr>=1.0.7' 'r-dtplyr>=1.2.0' 'r-forcats>=0.5.1' 'r-ggplot2>=3.3.5' 'r-googledrive>=2.0.0' 'r-googlesheets4>=1.0.0' 'r-haven>=2.4.3' 'r-hms>=1.1.1' 'r-httr>=1.4.2' 'r-jsonlite>=1.7.2' 'r-lubridate>=1.8.0' 'r-magrittr>=2.0.1' 'r-modelr>=0.1.8' 'r-pillar>=1.6.4' 'r-purrr>=0.3.4' 'r-readr>=2.1.1' 'r-readxl>=1.3.1' 'r-reprex>=2.0.1' 'r-rlang>=0.4.12' 'r-rstudioapi>=0.13' 'r-rvest>=1.0.2' 'r-stringr>=1.4.0' 'r-tibble>=3.1.6' 'r-tidyr>=1.1.4' 'r-xml2>=1.3.3')
makedepends=('gcc-fortran')
optdepends=('r-feather' 'r-knitr' 'r-rmarkdown' 'r-testthat' 'r-covr' 'r-glue')
sha256sums=('37fbf8b72e49e96b1770dfb8e37f3e9e29269e8d6c96d6d3902561252ec1cf61')
source=("https://cran.r-project.org/src/contrib/${_pkgtar}")

build(){
    cd "${srcdir}"
    R CMD INSTALL ${_pkgtar} -l ${srcdir}
}
package() {
    cd "${scrdir}"
    install -dm0755 "$pkgdir/usr/lib/R/library"
    cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}


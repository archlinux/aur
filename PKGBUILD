# Maintainer: Pranav K Anupam <pranavanupam@yahoo.com>
# Contributor: Alex Branham <branham@utexas.edu>
_cranname=tidyverse
_cranver=1.3.1
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-tidyverse
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Easily Install and Load the Tidyverse"
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL3' 'custom')
depends=('r>=3.3' 'r-broom>=0.7.6' 'r-cli>=2.4.0' 'r-crayon>=1.4.1' 'r-dplyr>=1.0.5' 'r-dbplyr>=2.1.1' 'r-dtplyr>=1.1.0' 'r-forcats>=0.5.1' 'r-googledrive>=1.0.1' 'r-googlesheets4>=0.3.0' 'r-ggplot2>=3.3.3' 'r-haven>=2.3.1' 'r-hms>=1.0.0' 'r-httr>=1.4.2' 'r-jsonlite>=1.7.2' 'r-lubridate>=1.7.10' 'r-magrittr>=2.0.1' 'r-modelr>=0.1.8' 'r-pillar>=1.6.0' 'r-purrr>=0.3.4' 'r-readr>=1.4.0' 'r-readxl>=1.3.1' 'r-reprex>=2.0.0' 'r-rlang>=0.4.10' 'r-rstudioapi>=0.13' 'r-rvest>=1.0.0' 'r-stringr>=1.4.0' 'r-tibble>=3.1.0' 'r-tidyr>=1.1.3' 'r-xml2>=1.3.2')
makedepends=('gcc-fortran')
optdepends=('r-feather' 'r-knitr' 'r-rmarkdown' 'r-testthat' 'r-covr' 'r-glue')
sha256sums=('83cf95109d4606236274f5a8ec2693855bf75d3a1b3bc1ab4426dcc275ed6632')
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


# Maintainer: frichtlm <frichtlm@gmail.com>
_cranname=dplyr
_cranver=0.8.4
pkgname=r-${_cranname}
pkgver=${_cranver}
pkgrel=1
pkgdesc="A grammar of data manipulation."
url="https://cran.r-project.org/package=${_cranname}"
arch=('any')
license=('MIT')
depends=('r>=3.2.0' 'r-ellipsis' 'r-assertthat>=0.2.0' 'r-glue>=1.3.0' 'r-magrittr>=1.5' 'r-pkgconfig' 'r-r6' 'r-rcpp>=1.0.1' 'r-rlang>=0.4.0' 'r-tibble>=2.0.0' 'r-tidyselect>=0.2.5' 'r-bh' 'r-plogr>=0.2.0' 'r-rcpp>=1.0.1')
optdepends=('r-bit64' 'r-callr' 'r-covr' 'r-crayon' 'r-dbi' 'r-dbplyr' 'r-dtplyr' 'r-ggplot2' 'r-hms' 'r-knitr' 'r-lahman' 'r-lubridate' 'r-mgcv' 'r-microbenchmark' 'r-nycflights13' 'r-rmarkdown' 'r-rmysql' 'r-rpostgresql' 'r-rsqlite' 'r-testthat' 'r-withr' 'r-broom' 'r-purrr' 'r-readr')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
#source=("http://cran.r-project.org/src/contrib/Archive/${_cranname}/${_cranname}_${_cranver}.tar.gz") # replace with this if 404 error
md5sums=('9d5eee2ae011523b7546dda000d55528') 

build() {
    cd "${srcdir}"
    R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l $srcdir
}

package() {
    cd "${srcdir}"
    install -dm0755 "$pkgdir/usr/lib/R/library"
    cp -a --no-preserve=ownership "$_cranname" "$pkgdir/usr/lib/R/library"
}

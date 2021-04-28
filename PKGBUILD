# Maintainer: dhn <neilson+aur@sent.com>

_pkgname=fredr
pkgname=r-$_pkgname
pkgver=2.1.0
pkgrel=1
pkgdesc="An R client for the 'Federal Reserve Economic Data' ('FRED') API <https://research.stlouisfed.org/docs/api/>. Functions to retrieve economic time series and other data from 'FRED'."
arch=('any')
url="https://cran.r-project.org/web/packages/$_pkgname/"
license=('MIT')
depends=('r' 'r-httr' 'r-jsonlite' 'r-rlang' 'r-tibble')
makedepends=()
optdepends=('r-covr' 'r-dplyr' 'r-ggplot2' 'r-knitr' 'r-purrr' 'r-rmarkdown' 'r-testthat' 'r-xts' 'r-zoo')
source=("https://cran.r-project.org/src/contrib/${_pkgname}_$pkgver.tar.gz")
sha512sums=('fa8f0bb72772e96dcfa15034e2ae16e253d958a3bf314b54374fe801e7225918e9c63bccb2cd2c8dd7c7e6d73633b2626412b815755e5dd6cc39fc71dd61d93a')

build(){
    R CMD INSTALL ${_pkgname}_$pkgver.tar.gz -l "$srcdir"
}

package() {
    install -dm 755 "$pkgdir"/usr/lib/R/library
    cp -a --no-preserve=ownership "${_pkgname}" "$pkgdir"/usr/lib/R/library
}

# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=imputeTS
_pkgver=3.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Time Series Missing Value Imputation"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-forecast
  r-ggplot2
  r-ggtext
  r-magrittr
  r-rcpp
  r-stinepack
)
optdepends=(
  r-covr
  r-knitr
  r-r.rsp
  r-rmarkdown
  r-testthat
  r-tibble
  r-timeseries
  r-tis
  r-tsibble
  r-xts
  r-zoo
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('92266787a6f8e6d4c6b49aee6aad307f')
b2sums=('7c18d6d3ad8d15206f935c3da07694d1068e5414f35f7cc43725508f45599ac5362127dcc0c374252b1fe02f4c3b5663fad654f3edd3ccad11fb96a9f73faaa4')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

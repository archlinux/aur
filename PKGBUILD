# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=imputeTS
_pkgver=3.4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
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
md5sums=('b29005e360b44936341510ff3381a510')
b2sums=('eae400058ee1fb3eeb3fbcc183e77c8cdc48088a675f689db4cb5038f887b38b6cf6c17521f6ff0f5bbcf59fce8302e5b2c2623bbc773bae7ec390ac785da88b')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

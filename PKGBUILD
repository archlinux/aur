# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=imputeTS
_pkgver=3.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//[:-]/.}
pkgrel=1
pkgdesc='Time Series Missing Value Imputation'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
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
sha256sums=('fdfdbec609c55ef21069c507d82fddcefe5da7925aae6f97263c32ea4255b678')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

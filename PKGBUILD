# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=bigrquery
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=1.4.0
pkgrel=4
pkgdesc="An Interface to Google's 'BigQuery' 'API'"
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-assertthat
  r-bit64
  r-curl
  r-dbi
  r-gargle
  r-glue
  r-httr
  r-jsonlite
  r-lifecycle
  r-prettyunits
  r-progress
  r-rapidjsonr
  r-rcpp
  r-rlang
  r-tibble
)
optdepends=(
  r-blob
  r-covr
  r-dbitest
  r-dbplyr
  r-dplyr
  r-hms
  r-readr
  r-sodium
  r-testthat
  r-withr
  r-wk
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('dafa4faef9fb9ab576d4975f64f23d4a051af180546db8f6fd55ed4383c1ba0a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

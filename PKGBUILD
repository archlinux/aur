# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=bigrquery
_pkgver=1.4.2
pkgname=r-${_pkgname,,}
pkgver=1.4.2
pkgrel=1
pkgdesc="An Interface to Google's 'BigQuery' 'API'"
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-assertthat
  r-bit64
  r-brio
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
sha256sums=('31fb4cb7fe471d8d869f99a727f7fbb1b6327533f6a0f364473b685c17e180e7')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

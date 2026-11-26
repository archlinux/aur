# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MSstatsPTM
_pkgver=2.16.0
pkgname=r-${_pkgname,,}
pkgver=2.16.0
pkgrel=1
pkgdesc='Statistical Characterization of Post-translational Modifications'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biostrings
  r-checkmate
  r-data.table
  r-dplyr
  r-ggplot2
  r-ggrepel
  r-gridextra
  r-htmltools
  r-msstats
  r-msstatsconvert
  r-msstatstmt
  r-plotly
  r-rcpp
  r-rlang
  r-stringi
  r-stringr
)
optdepends=(
  r-arrow
  r-covr
  r-knitr
  r-mockery
  r-rmarkdown
  r-testthat
  r-tinytest
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('166632890b33075816ed1b5b24d79cb6eb50537c841422d1c89870b2d8ec254b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

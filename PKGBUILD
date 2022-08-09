# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=flextable
_pkgver=0.7.3
pkgname=r-${_pkgname,,}
pkgver=0.7.3
pkgrel=1
pkgdesc='Functions for Tabular Reporting'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-base64enc
  r-data.table
  r-gdtools
  r-htmltools
  r-knitr
  r-officer
  r-rlang
  r-rmarkdown
  r-uuid
  r-xml2
)
optdepends=(
  r-bookdown
  r-broom
  r-commonmark
  r-equatags
  r-ggplot2
  r-magick
  r-mgcv
  r-pdftools
  r-scales
  r-testthat
  r-webshot
  r-xtable
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('571a644cf22fda5ad38c4bcc7e2f6355a96be1045cc7ffe8906a7c6e98475694')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

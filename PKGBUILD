# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=flextable
_pkgver=0.9.0
pkgname=r-${_pkgname,,}
pkgver=0.9.0
pkgrel=1
pkgdesc='Functions for Tabular Reporting'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-data.table
  r-gdtools
  r-htmltools
  r-knitr
  r-officer
  r-ragg
  r-rlang
  r-rmarkdown
  r-uuid
  r-xml2
)
optdepends=(
  r-bookdown
  r-broom
  r-broom.mixed
  r-cluster
  r-commonmark
  r-doconv
  r-equatags
  r-ggplot2
  r-lme4
  r-magick
  r-mgcv
  r-nlme
  r-officedown
  r-pdftools
  r-pkgdown
  r-scales
  r-tables
  r-testthat
  r-webshot2
  r-xtable
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('2e045c68f9d784072166da566aac74122fdba6d425f5730565de48350ecfbf5c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

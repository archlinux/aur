# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=flextable
_pkgver=0.9.6
pkgname=r-${_pkgname,,}
pkgver=0.9.6
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
  r-svglite
  r-tables
  r-testthat
  r-webshot2
  r-xtable
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('232e050bec231b5d58ca8ad54116c476d2dd683ac2824b3688c06250338f9229')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

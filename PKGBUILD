# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=PrecisionTrialDrawer
_pkgver=1.11.0
pkgname=r-${_pkgname,,}
pkgver=1.11.0
pkgrel=4
pkgdesc='A Tool to Analyze and Design NGS Based Custom Gene Panels'
arch=('any')
url="https://bioconductor.org/packages/3.15/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocparallel
  r-biomart
  r-brglm
  r-cgdsr
  r-data.table
  r-dt
  r-genomicranges
  r-ggplot2
  r-ggrepel
  r-googlevis
  r-httr
  r-iranges
  r-jsonlite
  r-lowmacaannotation
  r-magrittr
  r-matrixstats
  r-rcolorbrewer
  r-reshape2
  r-s4vectors
  r-shiny
  r-shinybs
  r-stringr
  r-xml
)
optdepends=(
  r-biocstyle
  r-dplyr
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/3.15/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('4cc451d5fb6c6aeda70a345421c77d2606f1d23446bfd94eda3dd81f64463cd6')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

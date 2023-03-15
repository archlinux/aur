# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=debrowser
_pkgver=1.26.3
pkgname=r-${_pkgname,,}
pkgver=1.26.3
pkgrel=1
pkgdesc='Interactive Differential Expresion Analysis Browser'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-annotate
  r-annotationdbi
  r-apeglm
  r-ashr
  r-clusterprofiler
  r-colourpicker
  r-deseq2
  r-dose
  r-dt
  r-edger
  r-enrichplot
  r-genomicranges
  r-ggplot2
  r-gplots
  r-harman
  r-heatmaply
  r-igraph
  r-iranges
  r-jsonlite
  r-limma
  r-org.hs.eg.db
  r-org.mm.eg.db
  r-pathview
  r-plotly
  r-rcolorbrewer
  r-rcurl
  r-reshape2
  r-s4vectors
  r-shiny
  r-shinybs
  r-shinydashboard
  r-shinyjs
  r-stringi
  r-summarizedexperiment
  r-sva
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('72b4aba628c2d679ec23e3f70a70b47c66a2749be5f5d67564f7f1408461476f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

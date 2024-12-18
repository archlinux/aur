# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=InterCellar
_pkgver=2.12.0
pkgname=r-${_pkgname,,}
pkgver=2.12.0
pkgrel=1
pkgdesc='InterCellar: an R-Shiny app for interactive analysis and exploration of cell-cell communication in single-cell transcriptomics'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-biomart
  r-circlize
  r-colorspace
  r-colourpicker
  r-complexheatmap
  r-config
  r-data.table
  r-dendextend
  r-dplyr
  r-dt
  r-factoextra
  r-fmsb
  r-fs
  r-ggplot2
  r-golem
  r-htmltools
  r-htmlwidgets
  r-igraph
  r-plotly
  r-plyr
  r-readxl
  r-rlang
  r-scales
  r-shiny
  r-shinyalert
  r-shinycssloaders
  r-shinydashboard
  r-shinyfeedback
  r-shinyfiles
  r-signal
  r-tibble
  r-tidyr
  r-umap
  r-visnetwork
  r-wordcloud2
)
optdepends=(
  r-attempt
  r-biocstyle
  r-glue
  r-graphite
  r-httr
  r-knitr
  r-processx
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('b3f709033c6e92ce07862e8f3e74dc5b5f8cec970bd186ea2c385c7b724e46cb')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:

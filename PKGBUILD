# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GeneTonic
_pkgver=2.0.2
pkgname=r-${_pkgname,,}
pkgver=2.0.2
pkgrel=1
pkgdesc='Enjoy Analyzing And Integrating The Results From Differential Expression Analysis And Functional Enrichment Analysis'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-annotationdbi
  r-backbone
  r-bs4dash
  r-circlize
  r-colorspace
  r-colourpicker
  r-complexheatmap
  r-dendextend
  r-deseq2
  r-dplyr
  r-dt
  r-dynamictreecut
  r-expm
  r-ggforce
  r-ggplot2
  r-ggrepel
  r-go.db
  r-igraph
  r-matrixstats
  r-plotly
  r-rcolorbrewer
  r-rintrojs
  r-rlang
  r-rmarkdown
  r-s4vectors
  r-scales
  r-shiny
  r-shinyace
  r-shinycssloaders
  r-shinywidgets
  r-summarizedexperiment
  r-tidyr
  r-tippy
  r-viridis
  r-visnetwork
  r-complexupset
)
optdepends=(
  r-biocstyle
  r-clusterprofiler
  r-htmltools
  r-knitr
  r-macrophage
  r-magrittr
  r-org.hs.eg.db
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('e3a20013c6ecadf561f134acd6fc528c68c129449098cfc60aaa8c7e0522b822')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:

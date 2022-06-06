# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=singleCellTK
_pkgver=2.6.0
pkgname=r-${_pkgname,,}
pkgver=2.6.0
pkgrel=1
pkgdesc='Comprehensive and Interactive Analysis of Single Cell RNA-Seq Data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-annotationdbi
  r-ape
  r-batchelor
  r-biobase
  r-biocparallel
  r-celda
  r-celldex
  r-circlize
  r-colorspace
  r-colourpicker
  r-complexheatmap
  r-cowplot
  r-data.table
  r-delayedarray
  r-delayedmatrixstats
  r-deseq2
  r-dplyr
  r-dropletutils
  r-dt
  r-enrichr
  r-experimenthub
  r-fields
  r-fishpond
  r-ggplot2
  r-ggplotify
  r-ggrepel
  r-ggtree
  r-gridextra
  r-gseabase
  r-gsva
  r-gsvadata
  r-igraph
  r-limma
  r-magrittr
  r-mast
  r-matrixstats
  r-metap
  r-msigdbr
  r-multtest
  r-plotly
  r-r.utils
  r-rcolorbrewer
  r-reshape2
  r-reticulate
  r-rlang
  r-rmarkdown
  r-rocr
  r-rtsne
  r-s4vectors
  r-scater
  r-scdblfinder
  r-scds
  r-scmerge
  r-scran
  r-scrnaseq
  r-seurat
  r-shiny
  r-shinyalert
  r-shinycssloaders
  r-shinyjs
  r-singlecellexperiment
  r-singler
  r-summarizedexperiment
  r-sva
  r-tenxpbmcdata
  r-tibble
  r-tximport
  r-vam
  r-withr
  r-yaml
  r-zinbwave
  r-trajectoryutils
  r-tscan
  r-soupx
)
optdepends=(
  r-biocgenerics
  r-biocstyle
  r-kableextra
  r-knitr
  r-lintr
  r-org.mm.eg.db
  r-rsubread
  r-shinybs
  r-shinyfiles
  r-shinyjqui
  r-shinythemes
  r-shinywidgets
  r-spelling
  r-stringr
  r-testthat
  r-xtable
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('2b7030e5fee606a5aec0b1d087b50208d77355a7f662f75a44bd69d45aef1b1a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:

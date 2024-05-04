# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=singleCellTK
_pkgver=2.14.0
pkgname=r-${_pkgname,,}
pkgver=2.14.0
pkgrel=1
pkgdesc='Comprehensive and Interactive Analysis of Single Cell RNA-Seq Data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-anndata
  r-annotationhub
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
  r-eds
  r-enrichr
  r-ensembldb
  r-experimenthub
  r-fields
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
  r-plyr
  r-r.utils
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
  r-scuttle
  r-seurat
  r-shiny
  r-shinyalert
  r-shinycssloaders
  r-shinyjs
  r-singlecellexperiment
  r-singler
  r-soupx
  r-summarizedexperiment
  r-sva
  r-tenxpbmcdata
  r-tibble
  r-trajectoryutils
  r-tscan
  r-tximport
  r-vam
  r-withr
  r-yaml
  r-zellkonverter
  r-zinbwave
)
optdepends=(
  r-biocgenerics
  r-biocstyle
  r-fastmap
  r-harmony
  r-kableextra
  r-knitr
  r-lintr
  r-org.mm.eg.db
  r-rcolorbrewer
  r-rsubread
  r-shinybs
  r-shinyfiles
  r-shinyjqui
  r-shinythemes
  r-shinywidgets
  r-spelling
  r-stringr
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('c42bdbfc62dacf88a783e1e479c7561b2a1d689d9b2cbbacce24b132036d171b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:

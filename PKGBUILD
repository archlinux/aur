# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BatchQC
_pkgver=2.8.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Batch Effects Quality Control Software"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-data.table
  r-deseq2
  r-dplyr
  r-ebseq
  r-ggdendro
  r-ggnewscale
  r-ggplot2
  r-limma
  r-matrixstats
  r-pheatmap
  r-rcolorbrewer
  r-reader
  r-reshape2
  r-scran
  r-shiny
  r-summarizedexperiment
  r-sva
  r-tibble
  r-tidyr
  r-tidyverse
  r-shinythemes
  r-s4vectors
  r-shinyjs
  r-edger
  r-fnn
  r-ggpubr
  r-harman
  r-umap
)
optdepends=(
  r-biocmanager
  r-biocstyle
  r-bladderbatch
  r-curatedtbdata
  r-devtools
  r-knitr
  r-lintr
  r-multiassayexperiment
  r-plotly
  r-rmarkdown
  r-spelling
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('2342f1f2580591cef0a5d628062ad5f7')
b2sums=('351530e5198b14fee06be5898740fe11225bda217404d9afe021c723a26f3ce024b45b340ddaad379a4691e74bba47ada7e45b2d6cfca4050c4f9697289441cd')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}

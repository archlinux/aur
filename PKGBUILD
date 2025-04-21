# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=animalcules
_pkgver=1.24.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Interactive microbiome analysis toolkit"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-ape
  r-assertthat
  r-caret
  r-covr
  r-deseq2
  r-dplyr
  r-dt
  r-forcats
  r-ggforce
  r-ggplot2
  r-gunifrac
  r-limma
  r-magrittr
  r-multiassayexperiment
  r-plotly
  r-rentrez
  r-reshape2
  r-rocit
  r-s4vectors
  r-scales
  r-shiny
  r-shinyjs
  r-summarizedexperiment
  r-tibble
  r-tidyr
  r-tsne
  r-umap
  r-vegan
  r-xml
)
optdepends=(
  r-biocstyle
  r-biomformat
  r-devtools
  r-glmnet
  r-knitr
  r-rmarkdown
  r-testthat
  r-usethis
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('e000498fb927187c87a43d19f5c3e422')
b2sums=('128dd5d3f88b6cf5fc29759067e43ddc754cfa4d1d30d6c5ef8c915bf010d7962f8d8425aca3951257fd50d3f4baddb9f2967d7adfbb47755e2de7de80da28f8')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=animalcules
_pkgver=1.18.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Interactive microbiome analysis toolkit"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=(Artistic2.0)
depends=(
  r-ape
  r-assertthat
  r-caret
  r-covr
  r-deseq2
  r-dplyr
  r-dt
  r-forcats
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
md5sums=('aa982cf7a1ee5300e2974be6dd3fc34f')
b2sums=('e9f9ba6651bbe8ec5393501d2e3da18f49ab90082eb6f3ba8bc7f9044daa00b4fed80b79088820db2c03446e4a36cb7bcc8fa3d9f8601e85834c0ad71f7c6fa9')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

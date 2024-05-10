# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=animalcules
_pkgver=1.20.0
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
md5sums=('05aa4c774cbe54aa5349a8137c39c34f')
b2sums=('f69f9926dda6f0421eb4eeaedfed20cbacc4df7ebe31ea0e684e66e199b10ffde3e6e0c6b59eefd023b9f8460a904c7ea342053d43359d0359948e50ff24151b')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

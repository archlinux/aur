# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RCSL
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Rank Constrained Similarity Learning for single cell RNA sequencing data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-ggplot2
  r-igraph
  r-matrixgenerics
  r-nbclust
  r-pracma
  r-rcpp
  r-rcppannoy
  r-rtsne
  r-singlecellexperiment
  r-umap
)
optdepends=(
  r-biocstyle
  r-knitr
  r-mclust
  r-rmarkdown
  r-testthat
  r-tidyverse
  r-tinytex
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('059014cb0394cffb1011e66abb8ef210')
b2sums=('e443c30267f75816daee44d6b20bd71acc0a345ea431ab01dc651783801730562313aff1cc5d09a7597cdc83a2b23e250f20f8b8ff83fa9456a1fa3ad7076a0f')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

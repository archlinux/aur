# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RCSL
_pkgver=1.22.0
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
md5sums=('3f99b8822eee6c58f7bf787f402c2ab7')
b2sums=('4532554e0ab6320e9ab84fa8b34550aedd339f704c6945670de1be17f979db83a663d7b222da3f9c0d3133dc8d791875b8092e2ea76414dfd42e2c85787296d3')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

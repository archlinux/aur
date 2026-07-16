# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RCSL
_pkgver=1.20.0
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
md5sums=('fc40086659c58268b0c51b70b3f51ff1')
b2sums=('70874a448971ab0126bffde1f7012de93be8473db3f406cc79794588bcf5a7a51b3c03c78395f185876c9495702cd6c67f1b149c0555c49d77016387e16289fc')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

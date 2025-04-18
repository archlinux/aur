# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RCSL
_pkgver=1.16.0
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
md5sums=('c00309d093059836af62df61e6bb4fe6')
b2sums=('634a31b1ecdfbbd8ad5268c29f6a0cc7a8a72e031dc783c99af9530b9aeb849c3b44de8b15da3b6806700d13fb61e6d3a76121d51e2557340ac22fc8ddb83406')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RCSL
_pkgver=1.14.0
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
md5sums=('2624ecbd83fdbb8adbd2478ca9c59f40')
b2sums=('c72c0a3b6340ae5dda2b7ee14318ce8ef84b59cd5f1ffaef380ba81497eb97ee9d30423be5a3b80ca77652cfce02a80f1dd7e1b309825117a49c958a85be0618')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

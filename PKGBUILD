# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=monocle
_pkgver=2.36.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Clustering, differential expression, and trajectory analysis for single- cell RNA-Seq"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-biobase
  r-biocgenerics
  r-biocviews
  r-combinat
  r-ddrtree
  r-dplyr
  r-fastica
  r-ggplot2
  r-hsmmsinglecell
  r-igraph
  r-irlba
  r-leidenbase
  r-limma
  r-matrixstats
  r-pheatmap
  r-plyr
  r-proxy
  r-rann
  r-rcpp
  r-reshape2
  r-rtsne
  r-slam
  r-stringr
  r-tibble
  r-vgam
  r-viridis
)
optdepends=(
  r-destiny
  r-hmisc
  r-knitr
  r-scater
  r-seurat
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('731947af3f435a16c24a0223ec1dced4')
b2sums=('3f0d3a37cb969f83f8210a682df6f8e6dd2351992c988ce6ee9a10fbe078e07eebf011be98b9fb8b602b7f5234d0380d29e2ec626ee5f719b63abd12f7e63d64')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

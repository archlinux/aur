# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=monocle
_pkgver=2.42.0
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
md5sums=('c2455f21029467977d1e55f7622bd70a')
b2sums=('ab784164894a6e0abe022b9b4c8b0745bfeca15984381b0bcd347e9bc37699271c8aa10b9eacc4a2d2dfde0c5beee6a4a48f444152b7c79372f27252cd59ee93')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

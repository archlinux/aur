# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=monocle
_pkgver=2.30.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
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
md5sums=('d958f3bb9af54d59a472f6ee6ddae596')
b2sums=('06b8938300de4c4d1e482ad2e9fa26a6773ae22c7cdb256799f29a7038dca5a4f50a2365765c1e69a4127d625a66cd3b60b6359a7ccc9631a69e936ea1ee4094')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

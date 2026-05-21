# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=monocle
_pkgver=2.40.0
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
md5sums=('ed0dcfe116008d5edcfe457d1f5365b9')
b2sums=('8483eef06a84da04e8dbad31166d99e61cb6031482e1a0328f2444001e31587aa9e1c1c7066f9b3c1af376a939712786752b3d5d080d42582e58b3f91e7088e9')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=scRepertoire
_pkgver=2.0.5
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A toolkit for single-cell immune receptor profiling"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-cubature
  r-dplyr
  r-evmix
  r-ggalluvial
  r-ggdendro
  r-ggplot2
  r-ggraph
  r-hash
  r-igraph
  r-inext
  r-plyr
  r-quantreg
  r-rcpp
  r-reshape2
  r-rjson
  r-rlang
  r-s4vectors
  r-seuratobject
  r-singlecellexperiment
  r-stringdist
  r-stringr
  r-summarizedexperiment
  r-tidygraph
  r-truncdist
  r-vgam
)
optdepends=(
  r-biocmanager
  r-biocstyle
  r-circlize
  r-knitr
  r-rmarkdown
  r-scales
  r-scater
  r-seurat
  r-spelling
  r-testthat
  r-vdiffr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('da9f3d7c7425305c060f7c0d852d7f20')
b2sums=('ee2e8334af937cf35192467bd83cc0024c3884df24fbe341aa6d8ef8aa94c4733b4de4fcf3cf5db7be101a21bd5215288c6eb6a6ebaba25ac4192e0cf50fd4db')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}

# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=scRepertoire
_pkgver=2.0.0
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
md5sums=('cada6940cf1146f26526d4dcdd6f68f4')
b2sums=('42c8ea83ae496d8d53b639c4c890b590953125c166c043effbf3ac214635ae33328805a44339ec11d2bb1c6199eb3375170b218d895fc608e9f28f66328fbb41')

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

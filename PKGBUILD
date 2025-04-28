# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=scviR
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="experimental inferface from R to scvi-tools"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-basilisk
  r-biocfilecache
  r-limma
  r-matrixgenerics
  r-pheatmap
  r-reticulate
  r-s4vectors
  r-scater
  r-shiny
  r-singlecellexperiment
  r-summarizedexperiment
)
optdepends=(
  r-biocstyle
  r-ggplot2
  r-knitr
  r-reshape2
  r-rhdf5
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('5b9817fd6ea382b0e4a983a5078291e8')
b2sums=('75b5ac24e47cb2e5bc07957b3ba100d14bd2c3f5f19fd965acd14c90b879611570baa3890a589f576b069e80ca72e264f6160c22d6eb31f2d57dc53ec707bf07')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

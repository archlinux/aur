# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=scviR
_pkgver=1.6.0
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
md5sums=('f74a3316c36a41c893d5fb09c718a465')
b2sums=('b3c24618f336a744d8feedbe48c17dead34778f698a82cf2f0ce61263929e1457a926fb1f7e62177aceb52312aa8c63d7365b89eb25eb66d5ee70b6a532b29f6')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=scviR
_pkgver=1.12.0
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
md5sums=('46b73492a1e1585649a0f4ac5afdc670')
b2sums=('552378aad46ce6b0c1a4f247d9d6369195ff96e5996ef96d2222d7a8f820329c99ce305e9275481e823dc4475f325f829c57888f2e4f8b8d834595ad709ec3a7')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

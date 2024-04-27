# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=scviR
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
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
md5sums=('71d6c427fcc042ac8b011a31935641df')
b2sums=('bf9703f6ed6cd2cc2da25bccfc06e986548eac8a0070a045ebba5428c274a20e3fdee47cddbf26da6d457b54d124ca817a2e07be250784919c9f73857e155aad')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

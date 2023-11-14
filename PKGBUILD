# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=scviR
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="experimental inferface from R to scvi-tools"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(Artistic2.0)
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
sha256sums=('0a15def9dcf1483c867cf45a795b14da37ac97aa686a29e50d2fda5b55475fd9')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

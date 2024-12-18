# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=mixOmics
_pkgver=6.30.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Omics Data Integration Project"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-biocparallel
  r-corpcor
  r-dplyr
  r-ellipse
  r-ggplot2
  r-ggrepel
  r-gridextra
  r-gsignal
  r-igraph
  r-matrixstats
  r-rarpack
  r-rcolorbrewer
  r-reshape2
  r-rgl
  r-tidyr
)
optdepends=(
  r-biocstyle
  r-knitr
  r-magick
  r-microbenchmark
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('bc07fef3c1ce86dbad92753050c4742e')
b2sums=('187e14ba6b0e15b47d5d1b51166ef8a0f519718f42a8f1bf0ada5b54a005f18d273d0027a2e07378b04eb34c093bc18c97fa3ee08094cd76e3b0a8e0606114f9')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

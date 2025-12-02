# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=mixOmics
_pkgver=6.34.0
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
  r-mime
  r-vdiffr
  r-kableextra
  r-devtools
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('be187fd2e61f3e88e6890f362d4e1af6')
b2sums=('c0a5be6872f7e13addbdd6a6bdb4c3bb7968603a419aaaa5a7dbbfafcd98989cf3c6c8b7a69df915468a33707f278cc1ec9585f76d3b078e3dc21cf05b1c2623')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

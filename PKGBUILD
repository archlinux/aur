# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SeqSQC
_pkgver=1.34.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A bioconductor package for sample quality check with next generation sequencing data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-e1071
  r-experimenthub
  r-gdsfmt
  r-genomicranges
  r-ggally
  r-ggplot2
  r-iranges
  r-plotly
  r-rcolorbrewer
  r-reshape2
  r-rmarkdown
  r-s4vectors
  r-snprelate
)
optdepends=(
  r-biocstyle
  r-knitr
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('6e20d3ae8acfad9dcb4a47cd62f6d2c3')
b2sums=('b65da787617ef5f608945f00669ee57049670c708bb6008641cf7460e95464c9f738cdfe79231c7a846ccb45dcb80e8304e9a16c2c1ec598e8a8a6ecaa7f873e')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

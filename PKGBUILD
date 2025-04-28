# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SeqSQC
_pkgver=1.30.0
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
md5sums=('45bab7bbc1cb999df25a98bf8baa3d98')
b2sums=('f5703d38af02ed630e305805b78e37eda1018d96e582607ef7d1f328d0c5ac7fb062e016ea4a8d997d5e629137eda99a5b8934310ec1901ad726efb9c1d9cabe')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

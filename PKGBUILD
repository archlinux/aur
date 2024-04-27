# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=FuseSOM
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="A Correlation Based Multiview Self Organizing Maps Clustering For IMC Datasets"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-analogue
  r-coop
  r-diptest
  r-fastcluster
  r-fcps
  r-fpc
  r-ggplot2
  r-ggplotify
  r-ggpubr
  r-pheatmap
  r-proxy
  r-psych
  r-s4vectors
  r-stringr
  r-summarizedexperiment
)
makedepends=(
  r-rcpp
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-singlecellexperiment
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('8f53b251d77ea648cb8e56bb5eb72b18')
b2sums=('42c90029ee93fbd4af481992d8e3a6a794e66cd58c3581962f51bc07d60141618e63630ccbd196045919fe02718a42be566e5e75f75f13b6c1d06a454b38eeac')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

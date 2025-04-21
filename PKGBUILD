# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MOSim
_pkgver=2.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Multi-Omics Simulation (MOSim)"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-dplyr
  r-edger
  r-ggplot2
  r-hiddenmarkov
  r-iranges
  r-lazyeval
  r-matrixstats
  r-rcpp
  r-rlang
  r-s4vectors
  r-scran
  r-seurat
  r-signac
  r-stringi
  r-stringr
  r-zoo
)
makedepends=(
  r-cpp11
)
optdepends=(
  r-biobase
  r-biocstyle
  r-bluster
  r-decor
  r-igraph
  r-knitr
  r-leiden
  r-markdown
  r-purrr
  r-rmarkdown
  r-rsamtools
  r-scales
  r-scater
  r-singlecellexperiment
  r-testthat
  r-tibble
  r-tidyr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('bb2a6bdea9266f413b5e2a88368df95a')
b2sums=('68a42197cc7e43bf94bb52b94c45541775ffe51599b51d8dd62681d1b417d6070b2fbb57cd1ad4c3d5beee46c157956fbb6ae3bb9b0591895691121ef8ec2b02')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

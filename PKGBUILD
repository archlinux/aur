# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MOSim
_pkgver=2.8.0
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
md5sums=('27cd525f0a3e44cb392da4d3c61e1457')
b2sums=('4bbd09d7f1c4a69b36de67c062e416dbd00ffbb96dafc8f4ce1721859c2ea8c6142f07ac0d53d3812c279f2b44b2fb1957867b94d8ad79f9b63a8c727e5c2de9')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

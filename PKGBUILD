# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MOSim
_pkgver=2.2.0
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
md5sums=('38533e929ac399f2bd03d8518ebe3653')
b2sums=('e93e315304e247f56d0049bc342962e2eb0e7fa2c0c4b8a2eaca5b2b6b764fcdfdfaad846f6aed534b1d968f63bf18cc7ba955ade227615b4767c6dab111560e')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

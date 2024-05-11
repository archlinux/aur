# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MOSim
_pkgver=2.0.0
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
md5sums=('f6de9c73396f84ca3dea595207c5186f')
b2sums=('fe7fffaf7c8c2ae6e4e233bf530442f9c3f02716d446738e56e8de1e2962ea3b6332ec2764638ef2e00bf1cb939b8a81b40913232ddc7d4e4d6f27d51343a983')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=miloR
_pkgver=2.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Differential neighbourhood abundance testing on a graph"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  blas
  lapack
  r-biocgenerics
  r-biocneighbors
  r-biocparallel
  r-biocsingular
  r-cowplot
  r-dplyr
  r-edger
  r-ggbeeswarm
  r-ggplot2
  r-ggraph
  r-ggrepel
  r-gtools
  r-igraph
  r-irlba
  r-limma
  r-matrixgenerics
  r-matrixstats
  r-numderiv
  r-patchwork
  r-rcolorbrewer
  r-rcpp
  r-s4vectors
  r-singlecellexperiment
  r-stringr
  r-summarizedexperiment
  r-tibble
  r-tidyr
)
makedepends=(
  r-rcpparmadillo
)
optdepends=(
  r-biocstyle
  r-covr
  r-curl
  r-knitr
  r-magick
  r-mousegastrulationdata
  r-mousethymusageing
  r-mvtnorm
  r-rcurl
  r-rmarkdown
  r-scater
  r-scran
  r-scrnaseq
  r-scuttle
  r-testthat
  r-uwot
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('f02be1539df5c6cfd31ae8042f78f274')
b2sums=('2a01b1ed954a83da6b5640145b41d25c3f67343a28307291f8bfe66f8ecb0462d024361e83882066409b2735fa824630d9903c28d857daf6655bc1dcc5f2e8a5')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

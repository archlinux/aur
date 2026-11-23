# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=miloR
_pkgver=2.8.1
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
  r-pracma
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
  r-sparsematrixstats
  r-testthat
  r-uwot
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('073954f6f91066bbdd21c4f92f3eccf0')
b2sums=('bb70e1639cd5ca0fc3d7f6aa902407ed23fcbbc97fc4d14f19a27c0b25321c7bb0aa5d191871742f9c5d25071134c3d3f9a8882266c14cad309fb101f4fc1ef2')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

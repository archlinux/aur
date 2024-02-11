# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=fcoex
_pkgver=1.13.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="FCBF-based Co-Expression Networks for Single Cells"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-clusterprofiler
  r-data.table
  r-dplyr
  r-fcbf
  r-ggplot2
  r-ggrepel
  r-igraph
  r-intergraph
  r-network
  r-pathwaypca
  r-progress
  r-scales
  r-singlecellexperiment
  r-sna
  r-stringr
)
optdepends=(
  r-biocmanager
  r-devtools
  r-gridextra
  r-knitr
  r-rmarkdown
  r-scater
  r-schex
  r-scran
  r-seurat
  r-tenxpbmcdata
  r-testthat
)
source=("https://bioconductor.org/packages/3.17/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('51dd0d01307faed7bae46f54e5fb7fa5')
b2sums=('ee991ee5cc1c9a453240e609699fb85cc1176ded92d0b59a6d6a167f98b4f964e4e689fc49c438e435fc53759a34881d5e58d5793e1b6b577e3db9c40e796200')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

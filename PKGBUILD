# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=scFeatures
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Multi-view representations of single-cell and spatial data for disease outcome prediction"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-ape
  r-aucell
  r-biocparallel
  r-cli
  r-delayedarray
  r-delayedmatrixstats
  r-dplyr
  r-dt
  r-ensdb.hsapiens.v79
  r-ensdb.mmusculus.v79
  r-ensembldb
  r-glue
  r-gsva
  r-gtools
  r-matrixgenerics
  r-msigdbr
  r-proxyc
  r-reshape2
  r-rmarkdown
  r-seurat
  r-singlecellsignalr
  r-spatstat.explore
  r-spatstat.geom
  r-tidyr
)
optdepends=(
  r-biocstyle
  r-classifyr
  r-clusterprofiler
  r-knitr
  r-org.hs.eg.db
  r-s4vectors
  r-survminer
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('df5ae072515e820cc5027911aae2e49a')
b2sums=('5af49d6be9310669427ce5ff1c7fd38f21e844aede832fcf873e4ab30f07aaa225dec3f21e30ada0b9c72add8e0edbc4444136f5ad587a32d1812c6fd47c051d')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

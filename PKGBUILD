# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=scFeatures
_pkgver=1.3.2
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
md5sums=('58b6496d5f812ef271a1cd47932b903c')
b2sums=('abf3e4360cdd4f6d61fe71b5bb8830fbc0fa09d763cb1333c8976a855edea7ba2577b4e4ed1c67c5542d396526498f5db8d6d9a55b46504d4dfacb8092b33928')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

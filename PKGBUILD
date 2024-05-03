# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=scFeatures
_pkgver=1.4.0
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
md5sums=('e755e535da381f93a8530f45a951369d')
b2sums=('9a014ead0910adc1c85fdfda060777aa0fa44973300aa375a6b5687b527fdb0d4aedcde504458fe993ac57c3f7646e9df05346489c86c2c55f88c5b148399bc5')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

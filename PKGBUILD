# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=scFeatures
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="scFeatures: Multi-view representations of single-cell and spatial data for disease outcome prediction"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(GPL3)
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
  r-spatialexperiment
  r-spatstat.explore
  r-spatstat.geom
  r-summarizedexperiment
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
md5sums=('00b3e1296507cdf60879fd6d112c1e53')
sha256sums=('9777d663977588c4848c595f053f6859f09cef67a1a1d2d9fd5c06bdb47faf24')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

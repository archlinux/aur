# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=scFeatures
_pkgver=1.12.0
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
  r-spatstat.explore
  r-spatstat.geom
  r-tidyr
)
optdepends=(
  r-biocstyle
  r-classifyr
  r-clusterprofiler
  r-data.table
  r-dose
  r-enrichplot
  r-ggplot2
  r-igraph
  r-knitr
  r-limma
  r-org.hs.eg.db
  r-pheatmap
  r-plotly
  r-s4vectors
  r-survminer
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('95d415fc95a7d35870ba957b0c49656c')
b2sums=('6ca524c9cec219fbba29911a48496c312ddd1b5df9d8a81288867746e2bfb5827d7c4f383fce89e3bcb58d0b80db4f078490d9f38342648785a041b95afef083')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

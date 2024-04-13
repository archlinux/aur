# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=compartmap
_pkgver=1.20.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Higher-order chromatin domain inference in single cells from scRNA-seq and scATAC-seq"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-biocsingular
  r-delayedarray
  r-delayedmatrixstats
  r-genomicranges
  r-ggplot2
  r-hdf5array
  r-raggedexperiment
  r-reshape2
  r-rmtstat
  r-rtracklayer
  r-scales
  r-summarizedexperiment
)
optdepends=(
  r-covr
  r-knitr
  r-markdown
  r-rcpp
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('7bb714178ae20c636a9e5b1cd3fde06c')
b2sums=('6a1553f1e930caf277fb36dc5b1d16d00d68de27b850f2ed811ba6781527cc507c4c6c16532ea54626afbca55c51be3d72209c3a7d2446d007c74bef965ffe7d')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

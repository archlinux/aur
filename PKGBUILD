# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=TDbasedUFEadv
_pkgver=1.12.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Advanced package of tensor decomposition based unsupervised feature extraction"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-biobase
  r-genomicranges
  r-hash
  r-rtensor
  r-shiny
  r-tdbasedufe
)
optdepends=(
  r-biocstyle
  r-dose
  r-enrichplot
  r-enrichr
  r-ggplot2
  r-gson
  r-knitr
  r-mofadata
  r-rmarkdown
  r-rtcga.clinical
  r-rtcga.rnaseq
  r-stringdb
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('45463ccc448743998e730959a54e2426')
b2sums=('2ed2bbaf02424331a6e2e2dcb84a3710a9b7bc4b2580bf30f654143974f6bade598d0ee81ecd9606ac405073d5157ae844fbfc06b943bab0343750b4af441aa7')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

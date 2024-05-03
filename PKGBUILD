# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=TDbasedUFEadv
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Advanced package of tensor decomposition based unsupervised feature extraction"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-biobase
  r-dose
  r-enrichplot
  r-enrichr
  r-genomicranges
  r-hash
  r-rtcga
  r-rtensor
  r-shiny
  r-stringdb
  r-tdbasedufe
)
optdepends=(
  r-biocstyle
  r-knitr
  r-mofadata
  r-rmarkdown
  r-rtcga.clinical
  r-rtcga.rnaseq
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('9ac2701a71d014b2726fd6d086751659')
b2sums=('ad69c9d39988d5ccb94a7aa3222cfd2084ca8403d3ba5a2ce5f1f46eea842796b53f6f8de778042bf1413d572608807aae859967bd40cf6feb0eeadecf5a0b63')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

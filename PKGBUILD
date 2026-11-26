# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=TDbasedUFEadv
_pkgver=1.14.0
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
  r-curatedtcgadata
  r-dose
  r-enrichplot
  r-enrichr
  r-ggplot2
  r-gson
  r-knitr
  r-mofadata
  r-multiassayexperiment
  r-rmarkdown
  r-stringdb
  r-summarizedexperiment
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('8a336b8a11f5c375c58fbae7a690fe46')
b2sums=('1346d5697bb5982c3a61b86e183586777972dc8456d21c2f4712c52340a65cf35d2555531292fb2bc4630aa780f5b08a45bba5135517b480472e5773a62af10e')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=scanMiR
_pkgver=1.14.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="scanMiR"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-biocparallel
  r-biostrings
  r-cowplot
  r-data.table
  r-genomeinfodb
  r-genomicranges
  r-ggplot2
  r-iranges
  r-pwalign
  r-s4vectors
  r-seqlogo
  r-stringi
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('1b8cd0cd0ccb096ff808099f10731c46')
b2sums=('c0c1cc017505811665f8811a92def57e9fd531416d64b9a2a527f166d0f5d69dfdbc4a3e50ae997286f1abcb79c9f0b73991c6df22a009252af2340d3072d457')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

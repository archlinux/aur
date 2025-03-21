# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=TDbasedUFEadv
_pkgver=1.6.0
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
md5sums=('c05ba77ef7e6572f3039df8041a12d5e')
b2sums=('8518f9f85fe939ba25b8341d0c411df0169a4572dd14fd96b5c7daadaa4c9c697e6aeb7a350bc3dc13c6f7a74a0339fc742fd1cdcfcc67aa3d0f26972a6ee162')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

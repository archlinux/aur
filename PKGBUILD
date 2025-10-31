# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=globalSeq
_pkgver=1.38.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Global Test for Counts"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r
)
optdepends=(
  r-knitr
  r-s4vectors
  r-summarizedexperiment
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('80cec8059cb02c48a2a8459ab69d8fa1')
b2sums=('0d9d8768d5d3bb03d3035af0e6de1dc4d33de2692cb0dd0b16aadff4ec14529bfcca8418778721281e52f0aefdf1c1d19f9314f6ca44c46df0be835ffb10087d')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

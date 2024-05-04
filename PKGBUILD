# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=JASPAR2016
_pkgver=1.32.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Data package for JASPAR 2016"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('8a0f0f62876001a314213a8acefeea40')
b2sums=('b36c4d40c31646d38aa67951b86c2612c77672a29d28b0ddbaf2905df14912527475cf36606383c49120e2d3f22c5e5780adf1eedc6330fb8cc4914ef9aff5df')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

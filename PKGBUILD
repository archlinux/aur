# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=diffGeneAnalysis
_pkgver=1.96.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Performs differential gene expression Analysis"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-minpack.lm
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('01d37aa08a0873aa1fa9a4bf2529d1d7')
b2sums=('028eb31ab5db66c724e14c891d4af406873f985abb128b6a0d328d101a4552ebb547fef56d60961d7b6eaa5ab11ecd8359da83879e10675d3be9ad212e06d88d')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

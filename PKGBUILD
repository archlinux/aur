# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MiChip
_pkgver=1.58.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="MiChip Parsing and Summarizing Functions"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-biobase
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('31eca1a746d1a4daf2c501f0aa24151b')
b2sums=('12b93957405da48ccb7e6cc236f63b13827c88480612bb5277fcf0e59b4204a8d0dd139e1c2f3ef00cf58a6e2d9dac227034fe088c932bfd92875c25cd27218c')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

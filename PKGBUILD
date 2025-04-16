# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=OSAT
_pkgver=1.56.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Optimal Sample Assignment Tool"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r
)
optdepends=(
  r-biobase
  r-xtable
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('044ffe7d924984adccca24649fff0d25')
b2sums=('e357f2063019b48b9ea234676dc57cd718b27273b385505024c715c242c918c7472d8ab73be0ea1c591e1cb1d2d3f4d02a6748bcbd4322e38d59886a7e71b34e')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RTCA
_pkgver=1.56.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Open-source toolkit to analyse data from xCELLigence System (RTCA)"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('LGPL-3.0-only')
depends=(
  r-biobase
  r-gtools
  r-rcolorbrewer
)
optdepends=(
  r-xtable
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('638895ac0776e264509ff2a41edbe9dd')
b2sums=('1eb18de92bc29df89a5e2bddef8493262047784efb17404e7f60a087d4de0fa7dd42a557c520e8cc5668b8a7af3e8f3d208a59679feb9c0246ce23b80ed812ad')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

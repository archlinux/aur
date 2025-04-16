# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SBMLR
_pkgver=2.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="SBML-R Interface and Analysis Tools"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-desolve
  r-xml
)
optdepends=(
  r-rsbml
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('0d443b85b8074146ca6611a01606f558')
b2sums=('e33e27bde91efbd2d9e693d7a9f50eaef385183dc6e5752a332a4788841abe6913a6495c3639df9593446909f3f91974e4be451d9fa00578170960e45c0abcf9')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

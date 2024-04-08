# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=venn
_pkgver=1.12
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Draw Venn Diagrams"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-or-later')
depends=(
  r-admisc
)
optdepends=(
  r-ggplot2
  r-ggpolypath
  r-qca
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('29b0e3dd951c8626b126705d88f8303a')
b2sums=('09b3727890b2b2447a076c94e8449e20e39c4cf2eaaf9c8ff9573dd1ede01ae6ea8f10f3a0342910e717bf49b6079329fcf66184c30ea215198d24c514ec9102')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

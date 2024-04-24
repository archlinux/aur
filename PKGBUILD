# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=som
_pkgver=0.3-5.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=10
pkgdesc="Self-Organizing Map"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-or-later')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('802a5a80902579354ce3420faeeeb756')
b2sums=('ca8fd769ee84497051ef0f14e288dbf1bd05e17a1d72d5b0520b8b0771e36e58f17ed41dfe771f3a3654e77610b365789e74b45e5d2eb4e274ba55adc2caa905')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

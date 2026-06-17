# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=irr
_pkgver=0.85
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Various Coefficients of Interrater Reliability and Agreement"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-lpsolve
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('40a7aef3e9ba6ca8648d8a16d128926b')
b2sums=('84d2dad10177500b46b5104f4961263158c81825eb46abcb32006b40d4173609d865017173d1f7ba5701154ff0f1ee708c37436c7d7ba43d19ea9d7147f38bd4')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

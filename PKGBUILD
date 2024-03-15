# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=ca
_pkgver=0.71.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=12
pkgdesc="Simple, Multiple and Joint Correspondence Analysis"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
optdepends=(
  r-rgl
  r-vcd
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b969859521e20e1b7daa6eacc568cf42')
b2sums=('897bb8c50496383963aaad79da0334cffa16b292669f4372e0387c40f68b664de55b9418ca546b8d1fbe7cf3c86ec9dcc71b575ac815f1cb406365e9ab7d77f9')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

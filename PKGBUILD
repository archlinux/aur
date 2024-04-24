# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RPMM
_pkgver=1.25
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=10
pkgdesc="Recursively Partitioned Mixture Model"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('3b449d676fd71ec4493db50e7f849dc9')
b2sums=('0232bec224a2c3f63ad34b2f980fc356e4bd77dc75fc7ca4b1655955dcb126eaf492c43486ea5276bbe5451427c6d7d4555d5b5c7045dc50f6a63c566acf9538')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

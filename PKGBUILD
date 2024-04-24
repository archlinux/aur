# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=binr
_pkgver=1.1.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=5
pkgdesc="Cut Numeric Values into Evenly Distributed Groups"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('Apache-2.0')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('51b205731c7101342207cf31a01b3d57')
b2sums=('8f6bae4464d3ed4bbb33fff4bc93e2724fa31b1902cfb3e00ac338dcba3f0622f38beb22b82c4b10adb9c56d39dfd723e3178585e26512d199e2ce5323e63781')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

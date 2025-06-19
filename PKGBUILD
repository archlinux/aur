# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CircStats
_pkgver=0.2-7
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Circular Statistics, from \"Topics in Circular Statistics\" (2001)"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('ca23b34c08046d6d7e918a0178628ac9')
b2sums=('64925f7f1669eee96d9c06355265f9ed8e442452c458ede368bf36455d3d87ab2255181d8504189ef3c9ffcb17437f5ec8712c09eea68dc8a36267c0c6387878')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

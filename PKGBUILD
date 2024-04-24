# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=varhandle
_pkgver=2.0.6
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Functions for Robust Variable Handling"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('e124f1fcd3becf77f3ba72f66abd0cc5')
b2sums=('047c77832318fa1ae665cc612cb7d860e4f3b035c21f00e64c8e167aafdca3e01bee65f4f4c2f640f75e703a6d0d8fee411d8ab71ffc49a1245c3338cf4d6405')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=segmented
_pkgver=2.3-0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Regression Models with Break-Points / Change-Points Estimation (with Possibly Random Effects)"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('f95a830cdee6a20b246684a0d20a3b7a')
b2sums=('b780ee5d3a81f68848d60d9a950a1bbf8d900cff20fc592926e4961b880fa5800b7f6023e49f18c7aaa22d182e9181b39825ab757eff6166babdf1cb28839ca1')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

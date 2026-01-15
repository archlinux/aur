# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=segmented
_pkgver=2.2-0
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
md5sums=('44c0f1720309330b6fbfde85cffa16ee')
b2sums=('59bdf5ea499d9300120a757310f39c6349c34d5f96f353e3000aeeb3168dbf6713fe05406d61794b669039a3b4452456c21a22b1edce5b7f2d718bd90030d27b')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=relimp
_pkgver=1.0-5
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=9
pkgdesc="Relative Contribution of Effects in a Regression Model"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
optdepends=(
  r-rcmdr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('0ce1f03f9ec99b940941d708e505afd0')
b2sums=('5bedb34d02d224934adb2cf2b43a1a0ff9d21f867f6632ae050061799abf2269a9cbf49de8558496f16e841c258fe03d0693d35363321eaf7e06073d9dedcbd5')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

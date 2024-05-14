# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RApiSerialize
_pkgver=0.1.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="R API Serialization"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('be0a84260b8b40a3a0aa01941f4bc792')
b2sums=('2facfe914717984377623952a3988623c7b539e0725f604fab6b233fabc56fbd8e3d663260d7821c4e815d547952264f70f71b8841fea8207eeec0754c84a2fc')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

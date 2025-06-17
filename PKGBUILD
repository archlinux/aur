# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=dtt
_pkgver=0.1-2.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Discrete Trigonometric Transforms"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('135e2c1b2cabcd056584b59329f5691c')
b2sums=('df4f3817375dd217b253222f67ddd32961e390e1e005c1865a0ce8c08db509bb18449f5bab6a868c05b4350e8a3f61fb9b3c036997058df5f3a7943f9e10fb0f')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

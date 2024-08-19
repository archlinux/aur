# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MBA
_pkgver=0.1-1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Multilevel B-Spline Approximation"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
makedepends=(
  r-bh
)
optdepends=(
  r-sp
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('88c08700f1736c8ae9ee8c72f369ea77')
b2sums=('0e3de3d5c21925095eaa772aac88d6540c714c7025865d4e5cd9b0f8b3df2f38857602118f7a4ab6853523787995da99b9811fff3086c00eaaabbadcb9970f7e')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

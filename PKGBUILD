# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=glm2
_pkgver=1.2.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=9
pkgdesc="Fitting Generalized Linear Models"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('fe8d4a7709bc259599bd61dd5442c492')
b2sums=('d61daa6c73c9f56e356ca6544421b17d6fcf0424eca2993fa4d1d777c7b3eb525ae12bf7f71eb46c49b87d41fd0a2bf05006872a467df0efbf4f73d4316799a0')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=logging
_pkgver=0.10-108
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=9
pkgdesc="R Logging Package"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=(GPL3)
depends=(
  r
)
optdepends=(
  r-crayon
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b72368fc427dc461d30ad6b8b4ba9482')
b2sums=('f50a7a40e9564f13c756d1b1e216e53bf5eacdff391ab0e49624103ee7d87296bfee3b6acde8e9964be46568ad8f77264d4f1107ea954f5b3aece49274afac1a')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

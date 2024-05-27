# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=splancs
_pkgver=2.01-45
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Spatial and Space-Time Point Pattern Analysis"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-sp
)
makedepends=(
  gcc-fortran
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('2ae06e1a84ac63303b25dd95d44e3c9a')
b2sums=('22f9d76a970f0305b02bfb03c4401f4b1c40325d250016bc78b5b22cb702f04adba97896b5c123a3464f8bd100226210145ef150f7dc677ec54051408bfcbc25')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

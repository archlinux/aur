# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=polspline
_pkgver=1.1.25
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Polynomial Spline Routines"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  blas
  r
)
makedepends=(
  gcc-fortran
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('df5c4ecb0a69bb6948b600d62488fc4f')
b2sums=('8f261cdb76a55a0f96444714ac3a52d13e2c547266130f128c83798866d94efb21a18560cefdc1691eec6837389b3ff2040967097f2a500ce26b4c96fda18eb5')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

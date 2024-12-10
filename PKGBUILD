# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=stringdist
_pkgver=0.9.14
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Approximate String Matching, Fuzzy Text Search, and String Distance Functions"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r
)
optdepends=(
  r-tinytest
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('e268cfdb93892e242172add3d387ef6a')
b2sums=('284e5487d9973635aa88e3d78994a42d916e7a50932bc264d2921f77018c9610a2f47b42e58674438465cca524057dc8a2c779dc4355142855c33b070ba69a31')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

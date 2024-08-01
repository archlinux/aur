# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=distances
_pkgver=0.1.11
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Tools for Distance Metrics"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-or-later')
depends=(
  r
)
optdepends=(
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('d7f3213d5df859261144573aeef65bf7')
b2sums=('d855b4682c5c0a8384017632912c762740090ff9f5ac96a6f76bb9505bb4dc5e3a080ff938e95374c276d48f899263c56dcdcddcd92ea966cf307467d29e4b5d')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

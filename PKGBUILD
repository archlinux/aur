# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=timsac
_pkgver=1.3.8-4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Time Series Analysis and Control Package"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
makedepends=(
  gcc-fortran
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('e325a5e8bceab47722a95d487c6a8f06')
b2sums=('e12504e0e852ba04d69f77ae26412d52a084a9b62b5c15daa1385be72bb5ed2f2246647c1af48069957d5b4699e790201e725a174decf7fb4967a5da86aa78b7')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

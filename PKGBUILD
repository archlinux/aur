# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=timsac
_pkgver=1.3.8-6
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
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
md5sums=('d1aaddc0f5c5a69fc907f7a6985ebb79')
b2sums=('53876141f21dedd286fa4408bf3607bafda150d282af2e2d7050038b4ec333f2372ce2719f1b1bfcf5a8943866c5cbcb2f5f8f46c3ae642e93bf2dd0ea0ddb36')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

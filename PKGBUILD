# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ash
_pkgver=1.0-15
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=9
pkgdesc="David Scott's ASH Routines"
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
md5sums=('59c282e7b2deb23bb6e8a97c9a371244')
b2sums=('6b7b9d5169122328d41923057a7f91f97bef7a08bd254fc76b59a1ddf9dce5c9bf3f38ffcea709c42a6390a50ebfeebaad63b980d7fe1d1e204b5e9aae7b3ddc')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

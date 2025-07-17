# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=spatstat.utils
_pkgver=3.1-5
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Utility Functions for 'spatstat'"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
optdepends=(
  r-spatstat.model
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('f107395bced5f735487b4f520b4882bc')
b2sums=('858d21f3ff75504aa7bbdcb565e3d718dee329246864bdaf1a8ad13b98aa48c86011636dd1a9b8c631ea0f751d38894174f510180d2bfdc98267adacd0e941c5')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RcppDate
_pkgver=0.0.4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="'date' C++ Header Library for Date and Time Functionality"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
optdepends=(
  r-rcpp
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('de2189cc74fe4c948a0e870f1d17dec0')
b2sums=('6f0ab6006945d8d56719407aca0bf20e1c3994bd87940202f7124c2b42bee51d3ec0dac33550c0c5f201747a277c1608c13bee89a63b218d774fe827e06b7256')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=XML2R
_pkgver=0.0.8
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Easier XML Data Collection"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-httr
  r-plyr
  r-xml
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('978ec418e6b0371a125821d46462d332')
b2sums=('dfc65809dd1220c20bb2d6c7a9eeef6dbc68b59a55aa1455e0581bb7eb0ecda3a7da510784c79db588e4b705533bbcbdc3c37ae8233a0ab37aada05e931d902c')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

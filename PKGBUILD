# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Rwave
_pkgver=2.6-5
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Time-Frequency Analysis of 1-D Signals"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('27fa1790348a2d01955b5636bc9cf060')
b2sums=('c87f4153877e3a9eafd229ddca1a38b0162d2ca3c03209b37c233940011480b98f814472ad3d9ac079551fd8e10601a630098ec4b0b1da993e1c28d148eaf885')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

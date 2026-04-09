# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=dtw
_pkgver=1.23-2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Dynamic Time Warping Algorithms"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-proxy
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('498ff42ae0824781ed7d0f83ee413719')
b2sums=('24544e46e1b2bd247dbce45ea63b312bbe59e6638319814040aa1c072cac4cf4e18abe2cbc3990b0be312b49eb0ce11dc44342ddea76eb23d00374cb281e85f2')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

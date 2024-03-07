# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=colorRamps
_pkgver=2.3.4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Builds Color Tables"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('5d338c19f816ffd8f1413aebc579236f')
b2sums=('6e582cf3890824e29e8180a566114508ade746184897f924519fa7713224c4c5c5330d886acb4cf66866b2b24bc8118b29497d8afe43ad00707474610e68d163')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

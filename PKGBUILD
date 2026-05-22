# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=logging
_pkgver=0.10-111
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="R Logging Package"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r
)
optdepends=(
  r-crayon
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('d8158871979c5ed3b7bd8b9c432bc468')
b2sums=('13b35f4262080126be380a87606102c873e6451bce490013178d182837a861b6af5064cb118b27c3e502178ba75d6785dc2f476554b98200a3ae9985c10608b7')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=aggregation
_pkgver=1.0.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="p-Value Aggregation Methods"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('8fef798b1cd1856c833ac3b729be8f7d')
b2sums=('f4cc967f55da9782deca8f2f141f61af2b9d575b4f17fea3d9b1bf7d056258c2481bf12553765509ba3cc57fb9dd45ea477dc4d162e6fe26bd692964f0894f5b')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

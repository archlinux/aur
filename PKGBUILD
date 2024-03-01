# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=proj4
_pkgver=1.0-14
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="A simple interface to the PROJ.4 cartographic projections library"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  proj
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('aa4414ed36bacf9c15e3e990b658cd90')
b2sums=('07223d6a298bde40e1eae1f682f2978a180be2f5b2f8d233f7d2614fc60260581fddd95cdbf6e74ff431e81917639544dd55ae0838d5cd612f1b8fdf8e8c1cf4')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

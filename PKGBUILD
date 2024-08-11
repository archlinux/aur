# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=epitools
_pkgver=0.5-10.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Epidemiology Tools"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('5687c399ed86c5de206164cd449e42ba')
b2sums=('ffc8ece8b0f1834a50ac77c9122cf47639a4eaca080582930ee34d1d3d291ed62d2a1d60a87debc3f50709f3531acfc182b6da483d7bd02b9944637275c4e92d')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

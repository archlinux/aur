# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=nsga2R
_pkgver=1.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=6
pkgdesc="Elitist Non-Dominated Sorting Genetic Algorithm"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('LGPL-3.0-only')
depends=(
  r-mco
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('d651c789c8a43bf6ae619ee16756dc94')
b2sums=('23290e5c22f8d97019c0bc3857ddafb438dd5a0586a32f56bc3bffe0a9bf4477a81b2171f616a6c421e331d8c378c7a3a3bfe60328da2cd61ea74703f300e340')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

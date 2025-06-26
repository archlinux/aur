# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=mapplots
_pkgver=1.5.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Data Visualisation on Maps"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
optdepends=(
  r-shapefiles
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('1348db65b899f74a73abb26c1f824211')
b2sums=('d2fd110848c34ac84f1768d835a6ab823d8b499a8f965ea011063ec3ae2925d8f02fd966a243a032741d0f0b11027d8ca4c35e8939d3bbbc561e9f812d1f85ad')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

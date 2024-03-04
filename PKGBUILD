# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=colorRamps
_pkgver=2.3.2
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
md5sums=('d14c789854947e7bbf74730d4466b10a')
b2sums=('a256e6ce30ad9676f22f871fbb075bff7ac26be888a8544af739e05c12199809d7ae20d2901769951924e3457d6dc9abb07782488e5f026720b7f9443ff38337')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

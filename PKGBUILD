# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=grImport
_pkgver=0.9-7
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Importing Vector Graphics"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  ghostscript
  r-xml
)
optdepends=(
  r-colorspace
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('15b22fb059f5cc409231f1af50b7316d')
b2sums=('e35f32334da85d0bfdce10443aed632637e21c18d96c148d0968711e154c7f5508c9c694f7905e0456a1137c451aaaaa96189cd10784646acc34a93bdcc55359')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

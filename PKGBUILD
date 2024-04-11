# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=xlsxjars
_pkgver=0.6.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=8
pkgdesc="Package required POI jars for the xlsx package"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-rjava
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('5a1721d5733cb42f3a29e3f353e39166')
b2sums=('3d3bb780c6078cfe6af6684fa56cdc2153700a6d53ce4ff6ffd8018a8b983eaab4bcafe8fc8d7e1cf7b9c51de7f8c51afce7f9f4bf64240e369aae8945713137')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

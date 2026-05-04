# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=hash
_pkgver=2.2.6.4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Full Featured Implementation of Hash Tables/Associative Arrays/Dictionaries"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
optdepends=(
  r-rbenchmark
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('d1802e126c3532e00ca7ad56e124480b')
b2sums=('3c335ac9f570072eea88fd1363d49ae94c335b6204bb0d630eaadc4c68f0b171758bc2dd3ec313786a9e05a791b6e680902d313c3540ed2fde6fb35b9f2ce685')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

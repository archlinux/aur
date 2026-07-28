# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RcppDate
_pkgver=0.0.7
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="'date' C++ Header Library for Date and Time Functionality"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
optdepends=(
  r-rcpp
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('0debfb91e9fb77b14cdfc30a82230d97')
b2sums=('382f84b29a0f7f524a4f5065b60c5a97ccdd3f5ead4cdc0854aba463b473e4a42e4fa168fc7e421d76187360d483c2cf757b61520ba465487c0f0472d96f2c90')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

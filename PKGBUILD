# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=glmpca
_pkgver=0.2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=7
pkgdesc="Dimension Reduction of Non-Normally Distributed Data"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('LGPL-3.0-or-later')
depends=(
  r
)
optdepends=(
  r-covr
  r-ggplot2
  r-knitr
  r-logisticpca
  r-markdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('66fdfc9cea90e82dadd1d47703ff50d2')
b2sums=('4ad691ca0b3d4b594b8a665af495e170890dffdbbe4541f55ad4fcca11c5f0cbbf7242d95f3e1d200589482894437589ae9082e7e39529d818c49a1658ce78e9')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

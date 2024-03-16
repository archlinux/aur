# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ROCit
_pkgver=2.1.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=9
pkgdesc="Performance Assessment of Binary Classifier with Visualization"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('4c3fabfdc2925c5a5c27ebeedecfbb90')
b2sums=('0ecf098496b766b904b521ee015d262c4d74b101377dcae36cfc3e87c4b09e899a00dfaf65e82b23beeca2e77e4bbba9c9c6a8c2f6356d6e5f9e02258053a326')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

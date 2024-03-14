# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Matching
_pkgver=4.10-14
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Multivariate and Propensity Score Matching with Balance Optimization"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r
)
optdepends=(
  r-rgenoud
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('c7cff83f8723c0f24c2c985a3a776ac7')
b2sums=('f4a6c20435fcc9b640040fbc2a5943b5ac94bab97c67d0ab5e8b7cfeab9c8a8ca764e756020aa419d7a8dfd3ba0aa45aacf0af5ceedcc2e060bc49347f5facbb')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=matrixTests
_pkgver=0.2.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Fast Statistical Hypothesis Tests on Rows and Columns of Matrices"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-matrixstats
)
optdepends=(
  r-car
  r-cosinor
  r-cosinor2
  r-moments
  r-nortest
  r-pmcmrplus
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('1da89222ad89baef2d138cf93713b3b5')
b2sums=('c048f945f3c1c22978ea35716ea5d31c02c71ec9fed8e29eb8db0b0bbd18dbf789ed4be7c30a90d50ccde87bb0abced0a150b48b600d947921a10c372b04f712')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=tester
_pkgver=0.3.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Tests and Checks Characteristics of R Objects"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r
)
optdepends=(
  r-knitr
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('d247ddb909ddb4f3365954d1bba4d5ad')
b2sums=('68bddc2840e61cf73b84984cc4a4e007fc1ca29e1334c260bdf7aea223b31979ee1158264b833039d0b146f857701f1b60e31fb56eccfc5e06fcaee801192226')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

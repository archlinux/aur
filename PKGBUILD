# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=tester
_pkgver=0.2.0
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
md5sums=('239068873263bee60f0fed365f2add6e')
b2sums=('57b7997203c46236e98cd16cfe3c04222c3093b70d8107c0d1140676dbb502479f5c6c648379aff42ebd7ff1522a14a4a6408666b8b1e34fa2f4d66d7b0cf90e')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

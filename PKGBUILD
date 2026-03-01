# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=lhs
_pkgver=1.2.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Latin Hypercube Samples"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-rcpp
)
optdepends=(
  r-doe.base
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('12128ac8afac4407eb752a4234459686')
b2sums=('de9ec8a0b77129b87b4b624ffe53ff2d96837c778e434e51142a6bd271602af947679d2e38d0d701e26c2cc44a84fc51cf4c32eccf8c331078a05371e2fed86b')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

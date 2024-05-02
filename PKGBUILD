# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=fmrs
_pkgver=1.14.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Variable Selection in Finite Mixture of AFT Regression and FMR Models"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r
)
optdepends=(
  r-biocgenerics
  r-knitr
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('d7606df31beb9c3e753be85f678f68cd')
b2sums=('1a4317863ce1e4d7ae41b261ce50c477a9343115a0df53e6a78b736af51b912a1540f1894ccfe39d7c54d4a5a98de8be49d36e4b7476f2ff699414fb0ad3ffb1')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

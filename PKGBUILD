# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CMA
_pkgver=1.64.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Synthesis of microarray-based classification"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-biobase
)
optdepends=(
  r-corpcor
  r-e1071
  r-gbm
  r-glmnet
  r-limma
  r-mvtnorm
  r-plsgenomics
  r-randomforest
  r-st
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('36009a31f66d88fc7e5f1136ce46880b')
b2sums=('fed9bc86f0f00b9f9e3759a0de429ff19e49ef5cae0b753913a4c3718ac2a9ca09443c37b0eb1bd55e34393f2879c034f8761da6faa3364b0da8ce34577e3232')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

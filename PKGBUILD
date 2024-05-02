# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CMA
_pkgver=1.62.0
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
md5sums=('87c395dda81102e1ca577357c18c520d')
b2sums=('4c0bec15617565d3e0b20264c9432365b270ec8295ac8cf73e87ee0f7e0d0aafb81f200ec5be1b197a6291d6d602de9020a7d0ff63968ba8ecbeb089ef28772d')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

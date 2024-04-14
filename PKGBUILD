# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CMA
_pkgver=1.60.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
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
md5sums=('6654a3ef8f06edc618b81b8a059b2139')
b2sums=('b1a3ac4cdc2377455c9adb54752310f9bc690c3a2970d9ea3d8b87a6eed62c6aa31619c4f867e747ee4de5af5012d3afd458592ac2f3f4c60b5a5078b7ab6e1b')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

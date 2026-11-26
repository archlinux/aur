# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CMA
_pkgver=1.72.0
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
md5sums=('b5916ed0dbbc7b3d2d34908da8e32e2d')
b2sums=('46c7bfb43f74e25cf7aeda624315361be0540cdac4fe65535c406c920d3d135c6820c212dfdda5dc51b920f1bd4d847d877d5b0cfb1a4cbcab67e82fd7c1aed3')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

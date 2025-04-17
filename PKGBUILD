# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CMA
_pkgver=1.66.0
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
md5sums=('cdca4ec23937b904a75e172c3e121cf8')
b2sums=('58b5ea937e46f19ae376cbb1c082e81599a33d00ae8ea6327748c0ccd23fec4a35c92868e6779b53ec1758e54c28c4a6f8528ccc52da80bdeeeed46240049ab2')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

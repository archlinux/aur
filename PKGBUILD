# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=EnMCB
_pkgver=1.20.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Predicting Disease Progression Based on Methylation Correlated Blocks using Ensemble Models"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-biocfilecache
  r-e1071
  r-ggplot2
  r-glmnet
  r-igraph
  r-mboost
  r-rms
  r-survivalroc
  r-survivalsvm
)
optdepends=(
  r-affycoretools
  r-biobase
  r-knitr
  r-limma
  r-plotroc
  r-rmarkdown
  r-summarizedexperiment
  r-survminer
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('ae61e321d66105defb55917977bfaf65')
b2sums=('1bc7d71874f343665ce2c7edc12b4623e37e68b5fcfa94274eb55fabce0eee7d5c8071758566b7a90fd32a1e976c6ecfb18251b860659037f8c15d17c331e988')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

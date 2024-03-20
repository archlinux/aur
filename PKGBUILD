# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=EnMCB
_pkgver=1.14.0
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
md5sums=('f9fee363d9285ffdf2895062fc0cf26b')
b2sums=('a5de7b457fd8eaddf133739616afe80daf7935a3715e38d4d096108c1a272f96ac2ba23fa40ff309e917230cba6326f8f2680db6d365fcb30b2243ac8c74805a')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

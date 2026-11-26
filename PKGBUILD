# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=EnMCB
_pkgver=1.26.0
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
md5sums=('d61041b1b302e8f937b40254c12e54d7')
b2sums=('7dc2427df4f97c04eb82338f8bf1a498dd0d4e943bb9d0613305003836c1c1194b6f714dd5ffa858c41512c336b01421e7e83b875ac60b71da599bc6278120c6')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

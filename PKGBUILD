# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=EnMCB
_pkgver=1.22.0
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
md5sums=('169588cb377dde8b52c5798058b5bba3')
b2sums=('af74608061436bbdecef4f2ef643e7b8986927f17b3e44d5e5c16b2c18b2067c2637d202c5fa65ffc10e8d1415a568ca69c284a6db66425c76823d2b70df6510')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

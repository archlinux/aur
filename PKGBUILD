# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rexposome
_pkgver=1.36.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Exposome exploration and outcome data analysis"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-biobase
  r-circlize
  r-corrplot
  r-factominer
  r-ggplot2
  r-ggrepel
  r-ggridges
  r-glmnet
  r-gplots
  r-gridextra
  r-gtools
  r-hmisc
  r-imputelcmd
  r-lme4
  r-lsr
  r-mice
  r-reshape2
  r-s4vectors
  r-scales
  r-scatterplot3d
  r-stringr
)
optdepends=(
  r-biocstyle
  r-flexmix
  r-formatr
  r-knitr
  r-mclust
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('a2f7e7fcd6ec7a1e3d57f2e78bf6ea99')
b2sums=('3e5b1d071ed584eaa6935853572c230abc0fc7e4c2fd277bb0f30ffe48e4b0ebb2fcd811412548ea3d3abe83cc8557727e5f6de26b2403b3c07045e25a3f11de')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}

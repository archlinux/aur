# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rexposome
_pkgver=1.30.0
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
  r-pryr
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
md5sums=('1f4bc5e1021eaf6c77d0ce384f4a074f')
b2sums=('6b07ad1ffc6a45c20345f9e3fc828cb060a25b8e093e90dcf8955995271065a0a52b1f1cd21d8d53a8a7d840dfb5e16e0cccdb76a7c683481647dc80eebf7925')

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

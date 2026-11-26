# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=evaluomeR
_pkgver=1.30.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Evaluation of Bioinformatics Metrics"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-corrplot
  r-dendextend
  r-dplyr
  r-flexmix
  r-fpc
  r-ggdendro
  r-ggplot2
  r-kableextra
  r-matrixstats
  r-mclust
  r-multiassayexperiment
  r-plotrix
  r-prabclus
  r-randomforest
  r-rdpack
  r-reshape2
  r-rskc
  r-sparcl
  r-summarizedexperiment
)
optdepends=(
  r-biocstyle
  r-knitr
  r-magrittr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('ac74a1b5615e6f1906bb7ed1cf01ae9f')
b2sums=('f04b4991de60e036264ec0125a81edc97c932969ddd530bff69a2cf61109d581f7b3923bed15b56dd729958e145a18d85aba8a862e0c7b88ac25730678c0b4de')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

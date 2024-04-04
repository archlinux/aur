# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RegEnrich
_pkgver=1.12.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Gene regulator enrichment analysis"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-biocparallel
  r-biocset
  r-biocstyle
  r-deseq2
  r-dose
  r-dplyr
  r-fgsea
  r-ggplot2
  r-limma
  r-magrittr
  r-randomforest
  r-reshape2
  r-s4vectors
  r-summarizedexperiment
  r-tibble
  r-wgcna
)
optdepends=(
  r-biocmanager
  r-geoquery
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('0ff27069819390e46f1e8e3b92acc257')
b2sums=('3bbb3e8922d6cdac61edfa3f06fe73ff8fab16b8113eba3caef0d84be9bf359ebe9959d775c63612355f670fad42adadff70cf079f5a2cbb5ac9d1d9f89fd25f')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

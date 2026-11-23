# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RegEnrich
_pkgver=1.22.2
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
  r-enrichit
  r-fgsea
  r-ggplot2
  r-gson
  r-limma
  r-magrittr
  r-qvalue
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
md5sums=('e64d852114fcbcef58679b5497695c14')
b2sums=('1b36c9d989e63e58c5501eebe49f8e5b534cdb59c9aee327e80a1fc5fa276aabe238bbb1fb2bdd23610826bd85a561f0760344f0226f4d4bee9c7a132b5c59e7')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

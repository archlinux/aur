# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RegEnrich
_pkgver=1.18.1
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
md5sums=('1798498bdc626d50024c63dc021c6ee9')
b2sums=('34cf98528a9f252e25b298cf0ee2fd5d9bf71f7aeac464bccef7ef2852376e6d034cf8a7a190fd14ef82fb69ffb205857302bd500a62ea4569da69dcb955788d')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

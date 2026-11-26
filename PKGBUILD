# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MAST
_pkgver=1.40.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Model-based Analysis of Single Cell Transcriptomics"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-abind
  r-biobase
  r-biocgenerics
  r-data.table
  r-ggplot2
  r-plyr
  r-progress
  r-reshape2
  r-s4vectors
  r-singlecellexperiment
  r-stringr
  r-summarizedexperiment
)
optdepends=(
  r-biocstyle
  r-blme
  r-car
  r-delayedarray
  r-dplyr
  r-gdata
  r-ggally
  r-gseabase
  r-hdf5array
  r-knitr
  r-limma
  r-lme4
  r-nmf
  r-numderiv
  r-rcolorbrewer
  r-rmarkdown
  r-roxygen2
  r-rsvd
  r-scater
  r-testthat
  r-txdb.hsapiens.ucsc.hg19.knowngene
  r-zinbwave
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('8877561bbb4af00337dd9f92212d7e68')
b2sums=('c0375d586eedf715a88089e0932ac89b0fcd37d81d7069b36466ef9a85573ddecfe397f67b16a135b3e6ef2486505841dd90a9bf35ef04efece27e7aa39eb976')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

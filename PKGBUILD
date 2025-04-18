# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MAST
_pkgver=1.33.0
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
md5sums=('32f6eba6564fd970099df0d9e2beaa44')
b2sums=('1a13eab5de7c673c65decf80d256eecc390345cede5642ee6974e795b9436800341515260c12bac0a72743485d4e408849ce096cd63e48a6b5d75520d28e0194')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

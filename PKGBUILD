# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MAST
_pkgver=1.38.0
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
md5sums=('07396afb22ac8623c40178489b82ce27')
b2sums=('02faef85b31eefc00c63d58cead971a76ed31252e13485b581911df5ea6ef219dacb3f322d6f145317e6d10383b553c432b830773278016f2005b5c99cf57bfc')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

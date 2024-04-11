# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=pathwayPCA
_pkgver=1.18.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Integrative Pathway Analysis with Modern PCA Methodology and Gene Selection"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-lars
)
optdepends=(
  r-airway
  r-circlize
  r-knitr
  r-rcurl
  r-reshape2
  r-rmarkdown
  r-summarizedexperiment
  r-survminer
  r-testthat
  r-tidyverse
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('100ae90b68c015f8e344da1d3a2a4863')
b2sums=('115c3037d1f00173f249ffcdbe152f36119bae1789f0d6257ceb352a0dd8643785594537a2d07df149350f38d8e8c870de5117e5320e7e888b94fd843cbacf29')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

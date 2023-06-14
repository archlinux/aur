# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=scp
_pkgver=1.10.1
pkgname=r-${_pkgname,,}
pkgver=1.10.1
pkgrel=1
pkgdesc='Mass Spectrometry-Based Single-Cell Proteomics Data Analysis'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-dplyr
  r-magrittr
  r-matrixstats
  r-mscoreutils
  r-multiassayexperiment
  r-qfeatures
  r-s4vectors
  r-singlecellexperiment
  r-summarizedexperiment
)
optdepends=(
  r-biocstyle
  r-ggplot2
  r-impute
  r-knitr
  r-patchwork
  r-preprocesscore
  r-rmarkdown
  r-scater
  r-sva
  r-testthat
  r-uwot
  r-vsn
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('12d9b113efb7af8d43d49e21776634f0366e537d2ab7a9eef554615c9c60f374')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

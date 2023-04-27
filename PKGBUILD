# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=easier
_pkgver=1.5.0
pkgname=r-${_pkgname,,}
pkgver=1.5.0
pkgrel=1
pkgdesc='Estimate Systems Immune Response from RNA-seq data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-biocparallel
  r-coin
  r-deseq2
  r-dorothea
  r-dplyr
  r-easierdata
  r-ggplot2
  r-ggpubr
  r-ggrepel
  r-matrixstats
  r-progeny
  r-quantiseqr
  r-reshape2
  r-rlang
  r-rocr
  r-rstatix
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-summarizedexperiment
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('7a6c6d284ce52eb79dda8ae0bd3ebebc28428cc174f7f416de5313a5e43f35fe')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:

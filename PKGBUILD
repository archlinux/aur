# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=easier
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=1.2.0
pkgrel=1
pkgdesc='Estimate Systems Immune Response from RNA-seq data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-arules
  r-biocparallel
  r-coin
  r-deseq2
  r-dorothea
  r-dplyr
  r-easierdata
  r-ggplot2
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
sha256sums=('c3a53fbf9a69243eb6222ca3e39a4ffe1f0c20bb82a63041a8f0d7c0da7d1421')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:

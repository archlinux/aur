# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=netDx
_pkgver=1.15.0
pkgname=r-${_pkgname,,}
pkgver=1.15.0
pkgrel=1
pkgdesc='Network-based patient classifier'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-bigmemory
  r-biocfilecache
  r-combinat
  r-doparallel
  r-foreach
  r-genomeinfodb
  r-genomicranges
  r-ggplot2
  r-glmnet
  r-httr
  r-igraph
  r-iranges
  r-multiassayexperiment
  r-plotrix
  r-pracma
  r-rappdirs
  r-rcolorbrewer
  r-reshape2
  r-rocr
  r-rtsne
  r-s4vectors
)
optdepends=(
  r-biocstyle
  r-clusterexperiment
  r-curatedtcgadata
  r-knitr
  r-netsmooth
  r-rcy3
  r-rmarkdown
  r-scater
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('903fe53e3b7840138dc08605e8c0d628c13927493e44ab5725f71a60151b1f5f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:

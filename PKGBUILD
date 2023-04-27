# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Cepo
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=1.6.0
pkgrel=1
pkgdesc='Cepo for the identification of differentially stable genes'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-biocparallel
  r-delayedarray
  r-delayedmatrixstats
  r-ggplot2
  r-gseabase
  r-hdf5array
  r-patchwork
  r-reshape2
  r-rlang
  r-s4vectors
  r-singlecellexperiment
  r-summarizedexperiment
  r-dplyr
)
optdepends=(
  r-biocstyle
  r-covr
  r-escape
  r-fgsea
  r-knitr
  r-patchwork
  r-pheatmap
  r-rmarkdown
  r-scater
  r-scmerge
  r-testthat
  r-upsetr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('ca075161110304e15acd1db3a66c826662fb872a05f2d3247c13a6fa89e494e6')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
#install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:

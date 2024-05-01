# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=mirTarRnaSeq
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=1.12.0
pkgrel=1
pkgdesc='mirTarRnaSeq'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-assertthat
  r-catools
  r-corrplot
  r-data.table
  r-dplyr
  r-ggplot2
  r-pheatmap
  r-pscl
  r-purrr
  r-r.utils
  r-reshape2
  r-viridis
)
optdepends=(
  r-biocstyle
  r-knitr
  r-r.cache
  r-rmarkdown
  r-sponge
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('1067143c2d2d280bdd725116f22aa7784f0d3337ba56a346f04a7455ed3dc2f2')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

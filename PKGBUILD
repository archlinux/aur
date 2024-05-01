# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=HiCBricks
_pkgver=1.22.0
pkgname=r-${_pkgname,,}
pkgver=1.22.0
pkgrel=1
pkgdesc='Framework for Storing and Accessing Hi-C Data Through HDF Files'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-biocparallel
  r-curl
  r-data.table
  r-digest
  r-genomeinfodb
  r-genomicranges
  r-ggplot2
  r-iranges
  r-jsonlite
  r-r.utils
  r-r6
  r-rcolorbrewer
  r-readr
  r-reshape2
  r-rhdf5
  r-s4vectors
  r-scales
  r-stringr
  r-tibble
  r-viridis
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('d60a6fe51123b13b491491a95d915bf8752235cdfba14d4536769807f7f17541')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:

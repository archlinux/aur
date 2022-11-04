# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=diffloop
_pkgver=1.24.0
pkgname=r-${_pkgname,,}
pkgver=1.24.0
pkgrel=4
pkgdesc='Identifying differential DNA loops from chromatin topology data'
arch=('any')
url="https://bioconductor.org/packages/3.15/${_pkgname}"
license=('MIT')
depends=(
  r
  r-biobase
  r-biomart
  r-data.table
  r-dplyr
  r-edger
  r-foreach
  r-genomeinfodb
  r-genomicranges
  r-ggplot2
  r-iranges
  r-limma
  r-locfit
  r-matrixstats
  r-pbapply
  r-plyr
  r-readr
  r-reshape2
  r-rtracklayer
  r-s4vectors
  r-statmod
  r-sushi
)
optdepends=(
  r-deseq2
  r-diffloopdata
  r-ggrepel
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/3.15/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('2f48de52b10b9b59bf31ca50f189939c3c155e14a852d1cb39fc77047c7a126c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:

# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ASpediaFI
_pkgver=1.11.0
pkgname=r-${_pkgname,,}
pkgver=1.11.0
pkgrel=1
pkgdesc='ASpedia-FI: Functional Interaction Analysis of Alternative Splicing Events'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocparallel
  r-biomart
  r-dplyr
  r-drawr
  r-e1071
  r-fgsea
  r-genomeinfodb
  r-genomicalignments
  r-genomicfeatures
  r-genomicranges
  r-ggplot2
  r-gviz
  r-igraph
  r-iranges
  r-ivas
  r-limma
  r-mgsz
  r-reshape2
  r-rocr
  r-rsamtools
  r-rtracklayer
  r-s4vectors
  r-scales
  r-summarizedexperiment
)
optdepends=(
  r-knitr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('bada73c70b81c82b88bd2a014b01d05a1eedde536a9df19311ae41a498f1568e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

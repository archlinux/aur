# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DOSE
_pkgver=3.26.2
pkgname=r-${_pkgname,,}
pkgver=3.26.2
pkgrel=1
pkgdesc='Disease Ontology Semantic and Enrichment analysis'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-annotationdbi
  r-biocparallel
  r-fgsea
  r-ggplot2
  r-gosemsim
  r-hdo.db
  r-qvalue
  r-reshape2
)
optdepends=(
  r-clusterprofiler
  r-gson
  r-knitr
  r-org.hs.eg.db
  r-prettydoc
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('6d586a82c5df930da38f723a6a8a4e883a05650aa9dbed51bf74451fb6df101e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

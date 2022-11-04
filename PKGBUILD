# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=TVTB
_pkgver=1.22.0
pkgname=r-${_pkgname,,}
pkgver=1.22.0
pkgrel=4
pkgdesc='TVTB: The VCF Tool Box'
arch=('any')
url="https://bioconductor.org/packages/3.15/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-annotationfilter
  r-biocgenerics
  r-biocparallel
  r-biostrings
  r-ensembldb
  r-ensemblvep
  r-genomeinfodb
  r-genomicranges
  r-ggally
  r-ggplot2
  r-gviz
  r-iranges
  r-limma
  r-reshape2
  r-rsamtools
  r-s4vectors
  r-summarizedexperiment
  r-variantannotation
)
optdepends=(
  r-biocstyle
  r-covr
  r-dt
  r-ensdb.hsapiens.v75
  r-knitr
  r-pander
  r-rmarkdown
  r-rtracklayer
  r-shiny
  r-testthat
)
source=("https://bioconductor.org/packages/3.15/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('1af5da609ec7b34cc10f5fe898bebf786f4fac573044fee992c86fe15df4dd00')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

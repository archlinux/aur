# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=derfinderPlot
_pkgver=1.36.0
pkgname=r-${_pkgname,,}
pkgver=1.36.0
pkgrel=1
pkgdesc='Plotting functions for derfinder'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-derfinder
  r-genomeinfodb
  r-genomicfeatures
  r-genomicranges
  r-ggbio
  r-ggplot2
  r-iranges
  r-limma
  r-plyr
  r-rcolorbrewer
  r-reshape2
  r-s4vectors
  r-scales
)
optdepends=(
  r-biocstyle
  r-biovizbase
  r-bumphunter
  r-covr
  r-derfinderdata
  r-knitr
  r-org.hs.eg.db
  r-refmanager
  r-rmarkdown
  r-sessioninfo
  r-testthat
  r-txdb.hsapiens.ucsc.hg19.knowngene
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('8f29517009458968811b9f619a3ec9e11fe2e26c5e4f17abf7efb120fb6ef6cf')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

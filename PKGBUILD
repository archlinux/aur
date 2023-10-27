# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=OMICsPCA
_pkgver=1.20.0
pkgname=r-${_pkgname,,}
pkgver=1.20.0
pkgrel=1
pkgdesc='An R package for quantitative integration and analysis of multiple omics assays from heterogeneous samples'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-clvalid
  r-corrplot
  r-cowplot
  r-data.table
  r-factoextra
  r-factominer
  r-fpc
  r-genomeinfodb
  r-ggplot2
  r-helloranges
  r-iranges
  r-kableextra
  r-magick
  r-multiassayexperiment
  r-nbclust
  r-omicspcadata
  r-pdftools
  r-performanceanalytics
  r-reshape2
  r-rgl
  r-rmarkdown
  r-rtracklayer
  r-tidyr
)
optdepends=(
  r-biocgenerics
  r-knitr
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('3ac2e544374700f86f8e4e37bb73f9dcb25fc4177e245098cfbc5b0066d9b836')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

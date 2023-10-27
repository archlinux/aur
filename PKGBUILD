# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ChIPQC
_pkgver=1.38.0
pkgname=r-${_pkgname,,}
pkgver=1.38.0
pkgrel=1
pkgdesc='Quality metrics for ChIPseq data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biobase
  r-biocgenerics
  r-biocparallel
  r-chipseq
  r-diffbind
  r-genomicalignments
  r-genomicfeatures
  r-genomicranges
  r-ggplot2
  r-gtools
  r-iranges
  r-nozzle.r1
  r-reshape2
  r-rsamtools
  r-s4vectors
  r-txdb.celegans.ucsc.ce6.ensgene
  r-txdb.dmelanogaster.ucsc.dm3.ensgene
  r-txdb.hsapiens.ucsc.hg18.knowngene
  r-txdb.hsapiens.ucsc.hg19.knowngene
  r-txdb.mmusculus.ucsc.mm10.knowngene
  r-txdb.mmusculus.ucsc.mm9.knowngene
  r-txdb.rnorvegicus.ucsc.rn4.ensgene
)
optdepends=(
  r-biocstyle
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('123e3c006c30aa0e6327d3bfc58729c8cc3f9d7274825282011a7b28b4e89328')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

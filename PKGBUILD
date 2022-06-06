# system requirements: RNASeqR only support Linux and macOS. Window is notsupported. Python2 is highly recommended. If your machine isPython3, make sure '2to3' command is available.
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RNASeqR
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=1.12.0
pkgrel=2
pkgdesc='RNASeqR: an R package for automated two-group RNA-Seq analysis workflow'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-ballgown
  r-biostrings
  r-clusterprofiler
  r-corrplot
  r-deseq2
  r-dose
  r-edger
  r-factoextra
  r-factominer
  r-ggplot2
  r-gridextra
  r-org.hs.eg.db
  r-org.sc.sgd.db
  r-pathview
  r-performanceanalytics
  r-pheatmap
  r-rafalib
  r-reshape2
  r-reticulate
  r-rsamtools
  r-stringr
  r-systempiper
  r-systempiperdata
  python2
  python
)
optdepends=(
  r-grid
  r-knitr
  r-png
  r-rmarkdown
  r-rnaseqrdata
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('25bf668244e24a52bc2a6425b4ea10f41674656d77fe6bfce3aaa245c9cc59b8')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

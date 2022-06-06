# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=enrichTF
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=1.12.0
pkgrel=1
pkgdesc='Transcription Factors Enrichment Analysis'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocgenerics
  r-bsgenome
  r-clusterprofiler
  r-genomeinfodb
  r-genomicranges
  r-ggplot2
  r-ggpubr
  r-heatmap3
  r-iranges
  r-jaspar2018
  r-magrittr
  r-motifmatchr
  r-pipeframe
  r-r.utils
  r-rmarkdown
  r-rtracklayer
  r-s4vectors
  r-tfbstools
)
optdepends=(
  r-knitr
  r-testthat
  r-webshot
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('a04c0e5999d5072d04dd7dede20071d11cf5b799fbdbaf7e5e182b795405653b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GenomicDistributions
_pkgver=1.4.3
pkgname=r-${_pkgname,,}
pkgver=1.4.3
pkgrel=1
pkgdesc='GenomicDistributions: fast analysis of genomic intervals with Bioconductor'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('BSD')
depends=(
  r
  r-biostrings
  r-data.table
  r-dplyr
  r-genomeinfodb
  r-genomicranges
  r-ggplot2
  r-iranges
  r-plyr
  r-reshape2
  r-broom
)
optdepends=(
  r-annotationfilter
  r-biocstyle
  r-bsgenome
  r-ensembldb
  r-extrafont
  r-genomicfeatures
  r-knitr
  r-rmarkdown
  r-rtracklayer
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('7afa1ead9535bc84d7a5765b6ed97816356bfed8fea09f37c1d909aaa2c29f61')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:

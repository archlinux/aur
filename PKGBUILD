# system requirements: MAFFT (>= 7.305), OligoArrayAux (>= 3.8), ViennaRNA(>= 2.4.1), MELTING (>= 5.1.1), Pandoc (>= 1.12.3)
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=openPrimeR
_pkgver=1.24.0
pkgname=r-${_pkgname,,}
pkgver=1.24.0
pkgrel=1
pkgdesc='Multiplex PCR Primer Design and Analysis'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-ape
  r-biocgenerics
  r-biostrings
  r-decipher
  r-digest
  r-distr
  r-distrex
  r-dplyr
  r-fitdistrplus
  r-foreach
  r-genomicranges
  r-ggplot2
  r-hmisc
  r-iranges
  r-lpsolveapi
  r-magrittr
  r-openxlsx
  r-plyr
  r-rcolorbrewer
  r-reshape2
  r-s4vectors
  r-scales
  r-seqinr
  r-stringdist
  r-stringr
  r-uniqtag
  r-xml
)
optdepends=(
  r-devtools
  r-doparallel
  r-knitr
  r-learnr
  r-pander
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('8d5069817ea94f2293d7e54bf01a97e5e0896c111f2229c954c7cf932f32f84a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

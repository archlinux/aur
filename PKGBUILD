# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GenomicDataCommons
_pkgver=1.20.3
pkgname=r-${_pkgname,,}
pkgver=1.20.3
pkgrel=1
pkgdesc='NIH / NCI Genomic Data Commons Access'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-dplyr
  r-genomicranges
  r-httr
  r-iranges
  r-jsonlite
  r-magrittr
  r-rappdirs
  r-readr
  r-rlang
  r-s4vectors
  r-summarizedexperiment
  r-tibble
  r-xml2
)
optdepends=(
  r-biocparallel
  r-biocstyle
  r-dt
  r-genomicalignments
  r-ggplot2
  r-knitr
  r-listviewer
  r-rmarkdown
  r-rsamtools
  r-testthat
  r-txdb.hsapiens.ucsc.hg38.knowngene
  r-variantannotation
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('0e14af5d91e895f3b6d4542d91f1d8a2917bc77d6a6f2596e750adcdd3f11227')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

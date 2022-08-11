# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GenomicDataCommons
_pkgver=1.20.2
pkgname=r-${_pkgname,,}
pkgver=1.20.2
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
sha256sums=('7fa46db2e360bc0e8213aee73f7d5c32de3155928e1357eafd8e482dd666f545')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

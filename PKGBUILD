# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=scruff
_pkgver=1.20.0
pkgname=r-${_pkgname,,}
pkgver=1.20.0
pkgrel=1
pkgdesc='Single Cell RNA-Seq UMI Filtering Facilitator (scruff)'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-annotationdbi
  r-biocgenerics
  r-biocparallel
  r-biostrings
  r-data.table
  r-genomeinfodb
  r-genomicalignments
  r-genomicfeatures
  r-genomicranges
  r-ggbio
  r-ggplot2
  r-ggthemes
  r-parallelly
  r-plyr
  r-rsamtools
  r-rsubread
  r-rtracklayer
  r-s4vectors
  r-scales
  r-shortread
  r-singlecellexperiment
  r-stringdist
  r-summarizedexperiment
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('c610f6759a02b0cf21bb8ab5d016aaaa9081a02b058f7bfed13a8b7687bbc47e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:

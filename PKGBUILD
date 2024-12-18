# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MutationalPatterns
_pkgver=3.16.0
pkgname=r-${_pkgname,,}
pkgver=3.16.0
pkgrel=1
pkgdesc='Comprehensive genome-wide analysis of mutational processes'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-biocgenerics
  r-biostrings
  r-bsgenome
  r-cowplot
  r-dplyr
  r-genomeinfodb
  r-genomicranges
  r-ggalluvial
  r-ggdendro
  r-ggplot2
  r-iranges
  r-magrittr
  r-nmf
  r-pracma
  r-purrr
  r-rcolorbrewer
  r-s4vectors
  r-stringr
  r-tibble
  r-tidyr
  r-variantannotation
)
optdepends=(
  r-annotationdbi
  r-biocstyle
  r-biomart
  r-bsgenome.hsapiens.ucsc.hg19
  r-ccfindr
  r-genomicfeatures
  r-gridextra
  r-knitr
  r-rmarkdown
  r-rtracklayer
  r-testthat
  r-txdb.hsapiens.ucsc.hg19.knowngene
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('d747ec7f10093ca7f78a4500e1916cd4b2ecf1b4e8bc41733ff21601687a4599')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:

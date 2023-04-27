# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=primirTSS
_pkgver=1.18.0
pkgname=r-${_pkgname,,}
pkgver=1.18.0
pkgrel=1
pkgdesc='Prediction of pri-miRNA Transcription Start Site'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocgenerics
  r-biostrings
  r-bsgenome.hsapiens.ucsc.hg38
  r-dplyr
  r-genomicranges
  r-genomicscores
  r-gviz
  r-iranges
  r-jaspar2018
  r-phastcons100way.ucsc.hg38
  r-purrr
  r-r.utils
  r-rtracklayer
  r-s4vectors
  r-shiny
  r-stringr
  r-tfbstools
  r-tibble
  r-tidyr
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('4c3547dec096956fca25d1bc09b747c05117b3f03cd256cfdc8f594f403326be')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

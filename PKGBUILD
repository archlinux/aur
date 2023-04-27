# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ORFik
_pkgver=1.19.7
pkgname=r-${_pkgname,,}
pkgver=1.19.7
pkgrel=1
pkgdesc='Open Reading Frames in Genomics'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-annotationdbi
  r-biocgenerics
  r-biocparallel
  r-biomart
  r-biomartr
  r-biostrings
  r-bsgenome
  r-cowplot
  r-data.table
  r-deseq2
  r-fst
  r-genomeinfodb
  r-genomicalignments
  r-genomicfeatures
  r-genomicranges
  r-ggplot2
  r-gridextra
  r-httr
  r-iranges
  r-jsonlite
  r-r.utils
  r-rcpp
  r-rsamtools
  r-rtracklayer
  r-s4vectors
  r-summarizedexperiment
  r-xml2
)
optdepends=(
  r-biocstyle
  r-bsgenome.hsapiens.ucsc.hg19
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('86b31d3724bb1be11e6e55fe6424613606e55c471b538a74528be5547bc529d6')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:

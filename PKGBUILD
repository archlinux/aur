# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=svaNUMT
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=1.12.0
pkgrel=1
pkgdesc='NUMT detection from structural variant calls'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-assertthat
  r-biocgenerics
  r-biostrings
  r-dplyr
  r-genomeinfodb
  r-genomicfeatures
  r-genomicranges
  r-rlang
  r-rtracklayer
  r-s4vectors
  r-stringr
  r-structuralvariantannotation
  r-variantannotation
)
optdepends=(
  r-bsgenome.hsapiens.ucsc.hg19
  r-circlize
  r-devtools
  r-ggplot2
  r-iranges
  r-knitr
  r-plyranges
  r-readr
  r-rmarkdown
  r-roxygen2
  r-summarizedexperiment
  r-testthat
  r-txdb.hsapiens.ucsc.hg19.knowngene
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('a99265827f89fa82a0005cf36044ffdacf63f710161ab1c4cc9fa788652b65f0')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

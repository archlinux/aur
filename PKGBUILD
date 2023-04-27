# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=svaRetro
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=1.6.0
pkgrel=1
pkgdesc='Retrotransposed transcript detection from structural variants'
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
  r-biocstyle
  r-circlize
  r-devtools
  r-ggplot2
  r-iranges
  r-knitr
  r-plyranges
  r-rmarkdown
  r-roxygen2
  r-stats
  r-summarizedexperiment
  r-testthat
  r-tictoc
  r-txdb.hsapiens.ucsc.hg19.knowngene
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('98dd75bcb12aed474b68cd1ba9c9bc035af5f548afb293b24c1ff73770d5d77a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

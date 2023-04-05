# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=StructuralVariantAnnotation
_pkgver=1.14.1
pkgname=r-${_pkgname,,}
pkgver=1.14.1
pkgrel=1
pkgdesc='Variant annotations for structural variants'
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
  r-iranges
  r-rlang
  r-rtracklayer
  r-s4vectors
  r-stringr
  r-summarizedexperiment
  r-variantannotation
)
optdepends=(
  r-biovizbase
  r-bsgenome.hsapiens.ucsc.hg19
  r-devtools
  r-ggbio
  r-ggplot2
  r-knitr
  r-rmarkdown
  r-roxygen2
  r-testthat
  r-tidyverse
  r-txdb.hsapiens.ucsc.hg19.knowngene
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('1c0e2640650125014c2525c25764edb9cf606c2ebd134e30d10e8fcd840c7013')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

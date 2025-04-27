# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=APAlyzer
_pkgver=1.22.0
pkgname=r-${_pkgname,,}
pkgver=1.22.0
pkgrel=1
pkgdesc='A toolkit for APA analysis using RNA-seq data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('LGPL')
depends=(
  r
  r-deseq2
  r-dplyr
  r-genomicalignments
  r-genomicfeatures
  r-genomicranges
  r-ggplot2
  r-ggrepel
  r-hybridmtest
  r-repmis
  r-rsamtools
  r-rsubread
  r-rtracklayer
  r-summarizedexperiment
  r-tidyr
  r-variantannotation
)
optdepends=(
  r-annotationdbi
  r-biocstyle
  r-knitr
  r-org.mm.eg.db
  r-pasillabamsubset
  r-rmarkdown
  r-tbx20bamsubset
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('493623ef046f3677725835712ed65f1e6db3cbab37c7c40e26d9a3cab25a4301')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

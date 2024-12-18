# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=APAlyzer
_pkgver=1.20.0
pkgname=r-${_pkgname,,}
pkgver=1.20.0
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
sha256sums=('bba66356e0d2b697dbb598650522d1b8454b6473f510c5875a80632a9ca2ea1b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SingleMoleculeFootprinting
_pkgver=2.0.0
pkgname=r-${_pkgname,,}
pkgver=2.0.0
pkgrel=1
pkgdesc='Analysis tools for Single Molecule Footprinting (SMF) data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocgenerics
  r-biostrings
  r-bsgenome
  r-data.table
  r-genomeinfodb
  r-genomicranges
  r-iranges
  r-plyr
  r-quasr
  r-rcolorbrewer
  r-ggpointdensity
  r-ggplot2
  r-ggrepel
  r-patchwork
  r-plyranges
  r-tidyverse
  r-viridis
)
optdepends=(
  r-bsgenome.mmusculus.ucsc.mm10
  r-devtools
  r-experimenthub
  r-knitr
  r-parallel
  r-readr
  r-rmarkdown
  r-singlemoleculefootprintingdata
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('91be0d6bc586bd64745b6ccf2bf318cd20e88490a0b1ee34093ba5b64e63e6fd')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

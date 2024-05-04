# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SingleMoleculeFootprinting
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=1.12.0
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
sha256sums=('bc512f4cb62f4f28b435cd3b179520600d7f519141e3b2440651b802feb7d8c3')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

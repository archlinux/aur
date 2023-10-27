# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SingleMoleculeFootprinting
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=1.10.0
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
sha256sums=('25f5df0e2eb836bc0fc80be1bfab0bb501f24d416199da14c6007b5a458eb096')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DominoEffect
_pkgver=1.18.0
pkgname=r-${_pkgname,,}
pkgver=1.18.0
pkgrel=1
pkgdesc='Identification and Annotation of Protein Hotspot Residues'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-annotationdbi
  r-biomart
  r-biostrings
  r-data.table
  r-genomeinfodb
  r-genomicranges
  r-iranges
  r-summarizedexperiment
  r-variantannotation
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('dce8e8228c26093e8df8c84a59f7d46cd5999104b2408282d86b128955156696')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

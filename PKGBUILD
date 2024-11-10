# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CODEX
_pkgver=1.38.0
pkgname=r-${_pkgname,,}
pkgver=1.38.0
pkgrel=1
pkgdesc='A Normalization and Copy Number Variation Detection Method for Whole Exome Sequencing'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biostrings
  r-bsgenome.hsapiens.ucsc.hg19
  r-genomeinfodb
  r-iranges
  r-rsamtools
  r-s4vectors
)
optdepends=(
  r-wes.1kg.wugsc
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('e2d74c67af7639eb3d09f209377c9373e8c6617ce0e1e0dc24204b06717c177f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

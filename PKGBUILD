# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CODEX
_pkgver=1.34.0
pkgname=r-${_pkgname,,}
pkgver=1.34.0
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
sha256sums=('5db84031718c0ba32510b272631bdfdc2d8eb951ac7bf76e5ac740dd45c5913e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

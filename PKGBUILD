# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=seq2pathway
_pkgver=1.40.0
pkgname=r-${_pkgname,,}
pkgver=1.40.0
pkgrel=1
pkgdesc='a novel tool for functional gene-set (or termed as pathway) analysis of next-generation sequencing data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biomart
  r-genomicranges
  r-gsa
  r-seq2pathway.data
  r-wgcna
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('9e6fc1af6ed7723e88a0ccaaab838c443abe75b7b9a347ac0be30fce941b42cb')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

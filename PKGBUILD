# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=seq2pathway
_pkgver=1.34.0
pkgname=r-${_pkgname,,}
pkgver=1.34.0
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
sha256sums=('3dff3859cba0e61c46a9176193616ea6a55c07a3c1c959a1e815ccd633d47ab4')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

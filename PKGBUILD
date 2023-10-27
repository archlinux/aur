# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SeqGSEA
_pkgver=1.42.0
pkgname=r-${_pkgname,,}
pkgver=1.42.0
pkgrel=1
pkgdesc='Gene Set Enrichment Analysis (GSEA) of RNA-Seq Data: integrating differential expression and splicing'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biobase
  r-biomart
  r-deseq2
  r-doparallel
)
optdepends=(
  r-genomicranges
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('c148922f511adc75089cadd62c16bae27b5605aa93b0c6daad533f74b2d8e63d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

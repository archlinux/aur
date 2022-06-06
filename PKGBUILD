# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MEDIPS
_pkgver=1.48.0
pkgname=r-${_pkgname,,}
pkgver=1.48.0
pkgrel=1
pkgdesc='DNA IP-seq data analysis'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biomart
  r-biostrings
  r-bsgenome
  r-dnacopy
  r-edger
  r-genomicranges
  r-gtools
  r-iranges
  r-preprocesscore
  r-rsamtools
  r-rtracklayer
)
optdepends=(
  r-biocstyle
  r-bsgenome.hsapiens.ucsc.hg19
  r-medipsdata
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('a025c9f0c5846ecd9e16ba3945c6522080272789c46ebaffb1cb422c8f12afe3')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

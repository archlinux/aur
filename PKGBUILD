# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CSAR
_pkgver=1.58.0
pkgname=r-${_pkgname,,}
pkgver=1.58.0
pkgrel=1
pkgdesc='Statistical tools for the analysis of ChIP-seq data'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-genomeinfodb
  r-genomicranges
  r-iranges
  r-s4vectors
)
optdepends=(
  r-biostrings
  r-shortread
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('54cc6df293398bb4da6721f6957a7d2ddd0889bf5649b64555f6a82b2e9d58ad')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

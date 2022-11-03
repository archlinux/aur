# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ChIPseqR
_pkgver=1.52.0
pkgname=r-${_pkgname,,}
pkgver=1.52.0
pkgrel=1
pkgdesc='Identifying Protein Binding Sites in High-Throughput Sequencing Data'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocgenerics
  r-biostrings
  r-fbasics
  r-genomicranges
  r-hilbertvis
  r-iranges
  r-s4vectors
  r-shortread
  r-timsac
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('719faf0a436b976fa6cc33ead8e7c55775374c09825cceee29bf236d8e598b40')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

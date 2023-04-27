# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ChIPseqR
_pkgver=1.54.0
pkgname=r-${_pkgname,,}
pkgver=1.54.0
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
sha256sums=('96fcf3d49020f4e21b81e208aa4ee7cce99f7938ef53a4f1267ba360d6dc298c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

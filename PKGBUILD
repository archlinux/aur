# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ChIC
_pkgver=1.18.0
pkgname=r-${_pkgname,,}
pkgver=1.18.0
pkgrel=1
pkgdesc='Quality Control Pipeline for ChIP-Seq Data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocgenerics
  r-caret
  r-catools
  r-chic.data
  r-genomeintervals
  r-genomicranges
  r-iranges
  r-progress
  r-randomforest
  r-rsamtools
  r-s4vectors
  r-spp
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('27ec98ccfd30d19eef077ec6885098b5f9696adfff64494b679a6351926800fc')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

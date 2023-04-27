# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ChIC
_pkgver=1.19.0
pkgname=r-${_pkgname,,}
pkgver=1.19.0
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
sha256sums=('da97ff9ff64cc4e511574cac2fff1b36fcaa9cf76ea4af19b2530fdb7b84757d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

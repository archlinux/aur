# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SimFFPE
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=1.10.0
pkgrel=1
pkgdesc='NGS Read Simulator for FFPE Tissue'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('LGPL')
depends=(
  r
  r-biostrings
  r-doparallel
  r-dplyr
  r-foreach
  r-genomicranges
  r-iranges
  r-rsamtools
  r-truncnorm
)
optdepends=(
  r-biocstyle
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('5f6e26e2163e6d6d5cbddc78d81d37b242b330b6d8d2946395b57f8ceda295d6')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RIPAT
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=1.8.0
pkgrel=1
pkgdesc='Retroviral Integration Pattern Analysis Tool (RIPAT)'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biomart
  r-genomicranges
  r-ggplot2
  r-iranges
  r-karyoploter
  r-openxlsx
  r-plyr
  r-regioner
  r-rtracklayer
  r-stringr
)
optdepends=(
  r-knitr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('5cdbc5f023f21275603791fe3cbac1660c8043314e600aa088e09197c04c0f7c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

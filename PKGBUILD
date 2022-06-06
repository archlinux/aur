# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=fabia
_pkgver=2.42.0
pkgname=r-${_pkgname,,}
pkgver=2.42.0
pkgrel=1
pkgdesc='FABIA: Factor Analysis for Bicluster Acquisition'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('LGPL')
depends=(
  r
  r-biobase
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('bb758c3f9c501a09a959ef1b61042b25994ec3f50a3cbf5adc05aaa6aae75711')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

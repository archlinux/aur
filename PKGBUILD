# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rcellminerData
_pkgver=2.24.0
pkgname=r-${_pkgname,,}
pkgver=2.24.0
pkgrel=1
pkgdesc='rcellminerData: Molecular Profiles and Drug Response for the NCI-60 Cell Lines'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('LGPL')
depends=(
  r
  r-biobase
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rcellminer
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('e66ee1b2ff45428705b89fa9e0dc1ed9621de13a1997653ecc5b3885236cb13a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

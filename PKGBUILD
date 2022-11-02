# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rcellminerData
_pkgver=2.19.1
pkgname=r-${_pkgname,,}
pkgver=2.19.1
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
sha256sums=('0e4507d6d46d0dedbdfabfaa80f94ebbe2dfd3a0ac5a6e3bf44213b9c9300340')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DAPARdata
_pkgver=1.26.4
pkgname=r-${_pkgname,,}
pkgver=1.26.4
pkgrel=1
pkgdesc='Data accompanying the DAPAR and Prostar packages'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-knitr
  r-msnbase
)
optdepends=(
  r-dapar
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('67ab33c48ff58b84eca0d8fe7a24f0ed627abb1d854429b06d137d0606ef7106')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=cMap2data
_pkgver=1.37.0
pkgname=r-${_pkgname,,}
pkgver=1.37.0
pkgrel=1
pkgdesc='Connectivity Map (version 2) Data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('fc2f90fd71c21975a890638ea90858f43879cca806f6fa61bf31dc1cbf48a020')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

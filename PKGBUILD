# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=profileModel
_pkgver=0.6.1
pkgname=r-${_pkgname,,}
pkgver=0.6.1
pkgrel=4
pkgdesc='Profiling Inference Functions for Various Model Classes'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
optdepends=(
  r-gnm
  r-mass
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('91dc25e81f52506593f5c8d80a6131510b14525262f65b4ac10ae0cad0b2a506')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

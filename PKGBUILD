# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=strucchange
_pkgver=1.5-2
pkgname=r-${_pkgname,,}
pkgver=1.5.2
pkgrel=4
pkgdesc='Testing, Monitoring, and Dating Structural Changes'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-sandwich
  r-zoo
)
optdepends=(
  r-car
  r-dynlm
  r-e1071
  r-foreach
  r-lmtest
  r-mvtnorm
  r-stats4
  r-tseries
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('7d247c5ae6f5a63c80e478799d009c57fb8803943aa4286d05f71235cc1002f8')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

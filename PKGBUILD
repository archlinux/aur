# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=survivalsvm
_pkgver=0.0.6
pkgname=r-${_pkgname,,}
pkgver=0.0.6
pkgrel=1
pkgdesc='Survival Support Vector Analysis'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-hmisc
  r-kernlab
  r-pracma
  r-quadprog
)
optdepends=(
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('804a8ffa13bad78b94d60a1d4998a8387885e473402e34fd6dee4d773ffdeb7a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=intervals
_pkgver=0.15.4
pkgname=r-${_pkgname,,}
pkgver=0.15.4
pkgrel=1
pkgdesc='Tools for Working with Points and Intervals'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('Artistic2.0')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('50c0e1e3aab3e7b72cc1f0a6559d96caa3a360e969c38538479907e6cbe39f8f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=proto
_pkgver=1.0.0
pkgname=r-${_pkgname,,}
pkgver=1.0.0
pkgrel=4
pkgdesc='Prototype Object-Based Programming'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
optdepends=(
  r-covr
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('9294d9a3b2b680bb6fac17000bfc97453d77c87ef68cfd609b4c4eb6d11d04d1')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

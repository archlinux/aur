# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=spatstat.linnet
_pkgver=3.2-6
pkgname=r-${_pkgname,,}
pkgver=3.2.6
pkgrel=1
pkgdesc="Linear Networks Functionality of the 'spatstat' Family"
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-spatstat.data
  r-spatstat.explore
  r-spatstat.geom
  r-spatstat.model
  r-spatstat.random
  r-spatstat.sparse
  r-spatstat.utils
)
optdepends=(
  r-goftest
  r-locfit
  r-spatstat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('826fecb077b15f531d2d0ff8e43b02abe9e75a38e3341113833bc699b1b930ba')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

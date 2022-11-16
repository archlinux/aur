# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=spatstat.linnet
_pkgver=3.0-3
pkgname=r-${_pkgname,,}
pkgver=3.0.3
pkgrel=1
pkgdesc="Linear Networks Functionality of the 'spatstat' Family"
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-spatstat.core
  r-spatstat.data
  r-spatstat.explore
  r-spatstat.geom
  r-spatstat.model
  r-spatstat.sparse
  r-spatstat.utils
)
optdepends=(
  r-goftest
  r-locfit
  r-spatstat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('405b9be3362d077d71001e70b40ed84e3d67f647d8fbe9b4b330289de4cc2cf9')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

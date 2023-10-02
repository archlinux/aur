# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BoolNet
_pkgver=2.1.9
pkgname=r-${_pkgname,,}
pkgver=2.1.9
pkgrel=1
pkgdesc='Construction, Simulation and Analysis of Boolean Networks'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-igraph
  r-xml
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('2e887189871fd9f274037013271d737c72357b18297ea476989b22dccaafb6a7')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

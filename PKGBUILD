# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BoolNet
_pkgver=2.1.8
pkgname=r-${_pkgname,,}
pkgver=2.1.8
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
sha256sums=('0205d0cdfa656b1b7b491c004bb18467095e517248d22822caed29d34f4f57da')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

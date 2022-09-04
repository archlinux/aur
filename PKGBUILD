# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BoolNet
_pkgver=2.1.7
pkgname=r-${_pkgname,,}
pkgver=2.1.7
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
sha256sums=('bb5a1146a1e53be10761363ce30be8869d883be4d2632446f552aff039b307ad')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

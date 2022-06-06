# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ggm
_pkgver=2.5
pkgname=r-${_pkgname,,}
pkgver=2.5
pkgrel=4
pkgdesc='Graphical Markov Models with Mixed Graphs'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-graph
  r-igraph
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('b1a153c9f6c036f364a0561dd4e22039d40ed75eb5e8e91bf0cd0b39c5348c87')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

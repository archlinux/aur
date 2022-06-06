# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GeneNet
_pkgver=1.2.16
pkgname=r-${_pkgname,,}
pkgver=1.2.16
pkgrel=4
pkgdesc='Modeling and Inferring Gene Networks'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-corpcor
  r-fdrtool
  r-longitudinal
)
optdepends=(
  r-graph
  r-rgraphviz
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('c1e98073ccdaa18f4952630bfe4fc0617106eeaf7ed94d347cb2773bd48333e4')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

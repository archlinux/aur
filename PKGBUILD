# system requirements: SVMlight
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=klaR
_pkgver=1.7-1
pkgname=r-${_pkgname,,}
pkgver=1.7.1
pkgrel=4
pkgdesc='Classification and Visualization'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-combinat
  r-questionr
)
optdepends=(
  r-clustmixtype
  r-clustvarlv
  r-e1071
  r-mlbench
  r-randomforest
  r-rpart
  r-scatterplot3d
  r-som
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('0354bafb1a202bc439660ecfcfe78359bc2881a69d15ff64afa049e4eb171d25')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

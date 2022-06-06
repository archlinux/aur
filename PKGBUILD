# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=picante
_pkgver=1.8.2
pkgname=r-${_pkgname,,}
pkgver=1.8.2
pkgrel=4
pkgdesc='Integrating Phylogenies and Ecology'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-ape
  r-vegan
)
optdepends=(
  r-brglm
  r-circular
  r-corpcor
  r-quantreg
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('56565ca7f7c37f49c961372a816724967c21a4f5025cd69b8b671122bfdc4aa7')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

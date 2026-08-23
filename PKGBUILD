# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=picante
_pkgver=1.8.4
pkgname=r-${_pkgname,,}
pkgver=1.8.4
pkgrel=1
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
sha256sums=('18e82c5cf582bd0beec3fa472fc13e89d1d7bf4426093b526257d2abf76d053a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

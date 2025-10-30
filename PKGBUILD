# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GraphAT
_pkgver=1.82.0
pkgname=r-${_pkgname,,}
pkgver=1.82.0
pkgrel=1
pkgdesc='Graph Theoretic Association Tests'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('LGPL')
depends=(
  r
  r-graph
  r-mcmcpack
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('4c3a6b45e24253343369420b923e6ec7c6a2694a2a636e2c94d4609776679f84')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

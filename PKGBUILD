# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=pscl
_pkgver=1.5.5
pkgname=r-${_pkgname,,}
pkgver=1.5.5
pkgrel=4
pkgdesc='Political Science Computational Laboratory'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
optdepends=(
  r-car
  r-coda
  r-lattice
  r-lmtest
  r-mcmcpack
  r-mgcv
  r-mvtnorm
  r-sandwich
  r-vcd
  r-zoo
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('054c9b88a991abdec3338688f58e81b6ba55f91edb988621864b24fd152fee6f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=pscl
_pkgver=1.5.5.1
pkgname=r-${_pkgname,,}
pkgver=1.5.5.1
pkgrel=1
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
sha256sums=('611367c3d34c78f2d4db79e630e38d7a5df8296bd7e72d258f6a115fbbe78d5b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=locfit
_pkgver=1.5-9.7
pkgname=r-${_pkgname,,}
pkgver=1.5.9.7
pkgrel=1
pkgdesc='Local Regression, Likelihood and Density Estimation'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
optdepends=(
  r-gam
  r-interp
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('48e5fcd089fbc609d8e4c62c390425fba1dd167ad95ae0bddc175cbbe1517aff')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

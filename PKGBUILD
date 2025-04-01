# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=papeR
_pkgver=1.0-6
pkgname=r-${_pkgname,,}
pkgver=1.0.6
pkgrel=1
pkgdesc='A Toolbox for Writing Pretty Papers and Reports'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-car
  r-gmodels
  r-xtable
)
optdepends=(
  r-foreign
  r-knitr
  r-lme4
  r-nlme
  r-rmarkdown
  r-survival
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('2be90ef13650481b4a2d3f544094e207bf7251d9959bbc555a1e93b26f09a0d9')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

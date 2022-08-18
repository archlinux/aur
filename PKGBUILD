# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=papeR
_pkgver=1.0-5
pkgname=r-${_pkgname,,}
pkgver=1.0.5
pkgrel=2
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
sha256sums=('9d547faf50d121644ada432525f04357759520063bd497cc2d540f68f673b824')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

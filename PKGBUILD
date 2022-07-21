# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=psych
_pkgver=2.2.5
pkgname=r-${_pkgname,,}
pkgver=2.2.5
pkgrel=1
pkgdesc='Procedures for Psychological, Psychometric, and Personality Research'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-mnormt
)
optdepends=(
  r-gparotation
  r-graph
  r-knitr
  r-lavaan
  r-lme4
  r-psychtools
  r-rcsdp
  r-rgraphviz
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('dcc3f9b30ed44dfd1de0366295a308e0b52959eb7ac9cb3bc3f32dc5b15fc321')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

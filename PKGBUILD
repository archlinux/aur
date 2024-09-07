# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=blme
_pkgver=1.0-6
pkgname=r-${_pkgname,,}
pkgver=1.0.6
pkgrel=1
pkgdesc='Bayesian Linear Mixed-Effects Models'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-lme4
)
optdepends=(
  r-expint
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('0608978044a00d0baaf09a694dc6edeac59dbfa373c4548e4ebbe335345c173e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

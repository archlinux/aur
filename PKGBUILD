# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=blme
_pkgver=1.0-8
pkgname=r-${_pkgname,,}
pkgver=1.0.8
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
sha256sums=('aa2434a13a0c67e44482bd182999e8d6041a43e0547042ff71ccc4564cf126e5')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

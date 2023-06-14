# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Robert Greener <me@r0bert.dev>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_pkgname=multcomp
_pkgver=1.4-24
pkgname=r-${_pkgname,,}
pkgver=1.4.24
pkgrel=1
pkgdesc='Simultaneous Inference in General Parametric Models'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-mvtnorm
  r-sandwich
  r-th.data
)
optdepends=(
  r-coin
  r-coxme
  r-fixest
  r-foreign
  r-glmmtmb
  r-iswr
  r-lme4
  r-lmtest
  r-mass
  r-nlme
  r-robustbase
  r-simcomp
  r-tram
  r-xtable
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('7e64ed3013620772f802863704f9530eabdf62c1a9df936c3e42636d344fb411')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

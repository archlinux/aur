#Maintainer: sukanka <su975853527 AT gmail.com>
_pkgname=jaspMixedModels
_pkgver=0.95.3
pkgname=r-${_pkgname,,}
pkgver=0.95.3
pkgrel=2
pkgdesc="Mixed Models Module for JASP"
arch=('any')
url="https://github.com/jasp-stats/${_pkgname}"
license=('GPL')
depends=(r
  r-afex
  r-emmeans
  r-ggplot2
  r-ggpol
  r-jaspbase
  r-jaspgraphs
  r-lme4
  r-loo
  r-mgcv
  r-rstan
  r-rstanarm
  r-stanova
)
groups=(r-jasp r-jaspcommon)
source=("${_pkgname}_${_pkgver}.tar.gz::${url}/archive/refs/tags/v${_pkgver}.tar.gz")
sha256sums=('e8c3010cd88ef368b11726ff3ba427c85cbbdce45def7eb97913822183880844')


build() {

  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}

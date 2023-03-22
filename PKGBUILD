# Maintainer: Hu Butui <hot123tea123@gmail.com>

_pkgname=report
_pkgver=0.5.7
pkgname=r-${_pkgname,,}
pkgver=0.5.7
pkgrel=1
pkgdesc='Automated Reporting of Results and Statistical Models'
arch=('any')
url="https://github.com/easystats/report"
license=('GPL')
depends=(
  r
  r-bayestestr
  r-datawizard
  r-effectsize
  r-insight
  r-parameters
  r-performance
)
optdepends=(
  r-brms
  r-dplyr
  r-ivreg
  r-knitr
  r-lavaan
  r-lme4
  r-rmarkdown
  r-rstanarm
  r-survival
  r-testthat
)
source=("${_pkgname}_${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('5e793c23d6d37b4732aa7c37ea4ff56e1be883ce3bd48b1ea3a45c110239efd3')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

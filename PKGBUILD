# Maintainer: Hu Butui <hot123tea123@gmail.com>

_pkgname=report
_pkgver=0.5.5
pkgname=r-${_pkgname,,}
pkgver=0.5.5
pkgrel=3
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
  r-bayesfactor
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
source=("${_pkgname}_${pkgver}.tar.gz::https://github.com/easystats/report/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('4a6ae6cb6690a37b654d52d7ea5b25872655bb9a8d250ea934437a7fde74e829')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

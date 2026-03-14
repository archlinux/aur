#Maintainer: sukanka <su975853527 AT gmail.com>
_pkgname=jaspPredictiveAnalytics
_pkgver=0.96.0
pkgname=r-${_pkgname,,}
pkgver=0.96.0
pkgrel=1
pkgdesc="This module offers analyses for JASP"
arch=('any')
url="https://github.com/jasp-stats/${_pkgname}"
license=('GPL-2.0-or-later')
depends=(r
  r-jaspbase
  r-jaspgraphs
  r-bsts
  r-bssm
  r-precrec
  r-reshape2
  r-boom
  r-lubridate
  r-prophet
  r-bart
  r-ebmaforecast
  r-imputets
  r-scoringrules
  r-scoringutils
)
optdepends=(r-testthat)
groups=(r-jasp r-jaspextra)
source=("${_pkgname}_${_pkgver}.tar.gz::${url}/archive/refs/tags/v${_pkgver}.tar.gz")
sha256sums=('4f3f78ab8e71d14dd8428dbb525e7255ab59d24edd5f9c3195a9a264a1f29a14')

build() {

  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}

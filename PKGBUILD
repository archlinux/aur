#Maintainer: sukanka <su975853527 AT gmail.com>
_pkgname=jaspPredictiveAnalytics
_pkgver=0.95.0
pkgname=r-${_pkgname,,}
pkgver=0.95.0
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
sha256sums=('7b14aad059d9370c970676679144ae4736e4e834ab659631b2ba57b9d9617c4c')

build() {

  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}

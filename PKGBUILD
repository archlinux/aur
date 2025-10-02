#Maintainer: sukanka <su975853527 AT gmail.com>
_pkgname=jaspRegression
_pkgver=0.95.3
pkgname=r-${_pkgname,,}
pkgver=0.95.3
pkgrel=1
pkgdesc="Regression Module for JASP"
arch=('x86_64')
url="https://github.com/jasp-stats/${_pkgname}"
license=('GPL')
depends=(r
  r-bas
  r-bstats
  r-combinat
  r-emmeans
  r-ggplot2
  r-ggrepel
  r-hmeasure
  r-jaspanova
  r-jaspbase
  r-jaspdescriptives
  r-jaspgraphs
  r-jaspttests
  r-lmtest
  r-logistf
  r-matrixstats
  r-mdscore
  r-ppcor
  r-purrr
  r-rcpp
  r-vgam
  r-statmod
)
groups=(r-jasp r-jaspcommon)
source=("${_pkgname}_${_pkgver}.tar.gz::${url}/archive/refs/tags/v${_pkgver}.tar.gz")
sha256sums=('279d785ad47ee053852b814b9b68e25307ee78e2731ba8c53cac3778c92be66b')


build() {

  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}

#Maintainer: sukanka <su975853527 AT gmail.com>
_pkgname=jaspRegression
_pkgver=0.17.2
pkgname=r-${_pkgname,,}
pkgver=0.17.2
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
sha256sums=('e179b4d7e40bb97a79cb0d2ee5c747167f9d7b9616e728df5925373fbe85b8b4')


build() {

  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  mkdir -p  ${pkgdir}/usr/lib/jasp-desktop/Modules
  ln -s /usr/lib/R/library ${pkgdir}/usr/lib/jasp-desktop/Modules/${_pkgname}
}

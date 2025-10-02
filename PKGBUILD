#Maintainer: sukanka <su975853527 AT gmail.com>
_pkgname=jaspDistributions
_pkgver=0.95.3
pkgname=r-${_pkgname,,}
pkgver=0.95.3
pkgrel=1
pkgdesc="Distributions Module for JASP"
arch=('any')
url="https://github.com/jasp-stats/${_pkgname}"
license=('GPL')
depends=(r
  r-car
  r-fitdistrplus
  r-ggplot2
  r-goftest
  r-gnorm
  r-jaspbase
  r-jaspgraphs
  r-nortest
  r-sgt
  r-sn
)
groups=(r-jasp r-jaspextra)
source=("${_pkgname}_${_pkgver}.tar.gz::${url}/archive/refs/tags/v${_pkgver}.tar.gz")
sha256sums=('786c07e0a2a4d4365f173cb1d9cd97ee4380f95ef9f6ce843d4b925db08782a4')


build() {

  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}

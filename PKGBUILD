#Maintainer: sukanka <su975853527 AT gmail.com>
_pkgname=jaspDistributions
_pkgver=0.95.0
pkgname=r-${_pkgname,,}
pkgver=0.95.0
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
sha256sums=('8753e574dbf3446c95271f2a49a3d614b49ad232b14999f98a8efdf5493695dd')


build() {

  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}

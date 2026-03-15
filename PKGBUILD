#Maintainer: sukanka <su975853527 AT gmail.com>
_pkgname=jaspBfpack
_pkgver=0.96.0
pkgname=r-${_pkgname,,}
pkgver=0.96.0
pkgrel=1
pkgdesc="BFpack Module for JASP"
arch=('any')
url="https://github.com/jasp-stats/${_pkgname}"
license=('GPL')
depends=(r
  r-bfpack
  r-bain
  r-ggplot2
  r-stringr
  r-jaspbase
  r-jaspgraphs
  r-coda
)
groups=(r-jasp r-jaspextra)
source=("${_pkgname}_${_pkgver}.tar.gz::${url}/archive/refs/tags/v${_pkgver}.tar.gz")
sha256sums=('4b1c6224dbff8986539d025906805f29ca7819819f6c4c4bc5599572dd71dbc9')


build() {

  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}

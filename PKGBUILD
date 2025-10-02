#Maintainer: sukanka <su975853527 AT gmail.com>
_pkgname=jaspBFF
_pkgver=0.95.3
pkgname=r-${_pkgname,,}
pkgver=0.95.3
pkgrel=1
pkgdesc="A Bayes factor function module for JASP"
arch=('any')
url="https://github.com/jasp-stats/${_pkgname}"
license=('GPL-3.0-or-later')
depends=(r
  r-bff
  r-jaspbase
  r-jaspgraphs
)
groups=(r-jasp r-jaspextra)
source=("${_pkgname}_${_pkgver}.tar.gz::${url}/archive/refs/tags/v${_pkgver}.tar.gz")
sha256sums=('e682442570e1330e33b6143b6e06a846c0fbeaa3fd044bb78e8eceb67187ccb5')

build() {

  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}

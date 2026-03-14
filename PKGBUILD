#Maintainer: sukanka <su975853527 AT gmail.com>
_pkgname=jaspBFF
_pkgver=0.96.0
pkgname=r-${_pkgname,,}
pkgver=0.96.0
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
sha256sums=('061900d721402b41ebd827bd7e141f757c8ca08c0e8d44dcdd062bd957f66529')

build() {

  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}

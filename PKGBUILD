#Maintainer: sukanka <su975853527 AT gmail.com>
_pkgname=jaspBFF
_pkgver=0.95.0
pkgname=r-${_pkgname,,}
pkgver=0.95.0
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
sha256sums=('608617e61371c322738cb12148e8b7ba6519d7cb8767710af3c3739b93e86553')

build() {

  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}

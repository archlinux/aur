#Maintainer: sukanka <su975853527 AT gmail.com>
_pkgname=jaspReliability
_pkgver=0.95.0
pkgname=r-${_pkgname,,}
pkgver=0.95.0
pkgrel=1
pkgdesc="Reliability Module for JASP"
arch=('any')
url="https://github.com/jasp-stats/${_pkgname}"
license=('GPL')
depends=(r
  r-bayesrel
  r-coda
  r-ggplot2
  r-ggridges
  r-jaspbase
  r-jaspgraphs
  r-laplacesdemon
  r-mass
  r-psych
  r-lme4
  r-irr
  r-mirt
)
groups=(r-jasp r-jaspextra)
optdepends=()
source=("${_pkgname}_${_pkgver}.tar.gz::${url}/archive/refs/tags/v${_pkgver}.tar.gz")
sha256sums=('9466753ea83fa80655d653b8627124f6d0bfa7fc2ca6b07d3a034f5e3d20db12')


build() {

  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}

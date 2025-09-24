#Maintainer: sukanka <su975853527 AT gmail.com>
_pkgname=jaspLearnBayes
_pkgver=0.95.0
pkgname=r-${_pkgname,,}
pkgver=0.95.0
pkgrel=1
pkgdesc="Learn Bayes Module for JASP"
arch=('any')
url="https://github.com/jasp-stats/${_pkgname}"
license=('GPL')
depends=(r
  r-extradistr
  r-ggplot2
  r-hdinterval
  r-jaspbase
  r-jaspgraphs
  r-mcmcpack
  r-mglm
  r-scales
  r-ggalluvial
  r-ragg
  r-rjags
  r-runjags
  r-posterior
  r-ggdist
  r-grid
  r-grdevices
  r-png
)
groups=(r-jasp r-jaspextra)
source=("${_pkgname}_${_pkgver}.tar.gz::${url}/archive/refs/tags/v${_pkgver}.tar.gz")
sha256sums=('3a47409dc12c8f4bcfa9b4a267da94ac9717ab9bdd9664d7a28efb9842c7751d')


build() {

  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}

#Maintainer: sukanka <su975853527 AT gmail.com>
_pkgname=jaspLearnBayes
_pkgver=0.17.2
pkgname=r-${_pkgname,,}
pkgver=0.17.2
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
  r-ggdist
  r-grid
  r-grdevices
  r-png
)
groups=(r-jasp r-jaspextra)
source=("${_pkgname}_${_pkgver}.tar.gz::${url}/archive/refs/tags/v${_pkgver}.tar.gz")
sha256sums=('a826d8e9c306ac0f55bc1dae4ad0d31163665728623b6bb2cce4f5cef2c8b1c3')


build() {

  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  mkdir -p  ${pkgdir}/usr/lib/jasp-desktop/Modules
  ln -s /usr/lib/R/library ${pkgdir}/usr/lib/jasp-desktop/Modules/${_pkgname}
}

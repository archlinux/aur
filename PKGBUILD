#Maintainer: sukanka <su975853527 AT gmail.com>
_pkgname=jaspAcceptanceSampling
_pkgver=0.18.0
pkgname=r-${_pkgname,,}
pkgver=0.18.0
pkgrel=1
pkgdesc="Lot sampling for acceptance/rejection of lots"
arch=('any')
url="https://github.com/jasp-stats/${_pkgname}"
license=('GPL')
depends=(r
  r-abtest
  r-bayesfactor
  r-conting
  r-ggplot2
  r-jaspbase
  r-jaspgraphs
  r-plyr
  r-stringr
  r-vcd
  r-vcdextra
  r-acceptancesampling
)
groups=(r-jasp r-jaspextra)
source=("${_pkgname}_${_pkgver}.tar.gz::${url}/archive/refs/tags/v${_pkgver}.tar.gz")
sha256sums=('a613119a5a8c072c33cea5eb47fbe5f726d033c669f5653db727f6ae2817af8b')


build() {

  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  mkdir -p  ${pkgdir}/usr/lib/jasp-desktop/Modules
  ln -s /usr/lib/R/library ${pkgdir}/usr/lib/jasp-desktop/Modules/${_pkgname}
}

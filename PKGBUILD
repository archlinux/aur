#Maintainer: sukanka <su975853527 AT gmail.com>
_pkgname=jaspAnova
_pkgver=0.18.0
pkgname=r-${_pkgname,,}
pkgver=0.18.0
pkgrel=1
pkgdesc="ANOVA Module for JASP"
arch=('any')
url="https://github.com/jasp-stats/${_pkgname}"
license=('GPL')
depends=(r
  r-afex
  r-bayesfactor
  r-boot
  r-car
  r-colorspace
  r-emmeans
  r-ggplot2
  r-jaspbase
  r-jaspdescriptives
  r-jaspgraphs
  r-jaspttests
  r-kernsmooth
  r-matrixstats
  r-multcomp
  r-onewaytests
  r-plyr
  r-stringi
  r-stringr
  r-restriktor
)
groups=(r-jasp r-jaspcommon)
optdepends=()
source=("${_pkgname}_${_pkgver}.tar.gz::${url}/archive/refs/tags/v${_pkgver}.tar.gz")
sha256sums=('3ded7d3d05c4a4fbf4e02e4ff2a4c0841d3e372116e4c2d84a3af4702d74db0a')


build() {

  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  mkdir -p  ${pkgdir}/usr/lib/jasp-desktop/Modules
  ln -s /usr/lib/R/library ${pkgdir}/usr/lib/jasp-desktop/Modules/${_pkgname}
}

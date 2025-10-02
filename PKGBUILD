#Maintainer: sukanka <su975853527 AT gmail.com>
_pkgname=jaspAnova
_pkgver=0.95.3
pkgname=r-${_pkgname,,}
pkgver=0.95.3
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
  r-effectsize
  r-ggplot2
  r-jaspbase
  r-jaspdescriptives
  r-jaspgraphs
  r-jaspttests
  r-kernsmooth
  r-matrixstats
  r-multcomp
  r-multcompview
  r-mvshapirotest
  r-onewaytests
  r-plyr
  r-stringi
  r-stringr
  r-restriktor
)
groups=(r-jasp r-jaspcommon)
optdepends=()
source=("${_pkgname}_${_pkgver}.tar.gz::${url}/archive/refs/tags/v${_pkgver}.tar.gz")
sha256sums=('b67702a542bca1cf50a3e85c49bdbff409006db10ec91df4a68e05ce33f309c5')


build() {

  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}

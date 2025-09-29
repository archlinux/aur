#Maintainer: sukanka <su975853527 AT gmail.com>
_pkgname=jaspSurvival
_pkgver=0.95.0
pkgname=r-${_pkgname,,}
pkgver=0.95.0
pkgrel=1
pkgdesc="A Survival analysis module required by JASP"
arch=('any')
url="https://github.com/jasp-stats/${_pkgname}"
license=('GPL')
depends=(
  r
  r-survival
  r-survminer
  r-jaspbase
  r-jaspgraphs
  r-ggsurvfit
  r-flexsurv
)
groups=(r-jasp r-jaspextra)
source=("${_pkgname}_${_pkgver}.tar.gz::${url}/archive/refs/tags/v${_pkgver}.tar.gz")
sha256sums=('2a3c8cb86e92ee3bb9dbdfffcb8c6dadd205fb230985671b4eab48fe0047e7dd')


build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}

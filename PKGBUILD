#Maintainer: sukanka <su975853527 AT gmail.com>
_pkgname=jaspSurvival
_pkgver=0.95.3
pkgname=r-${_pkgname,,}
pkgver=0.95.3
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
sha256sums=('cc48ada57ed7c6aa8e207d01f8d9e6e3c93e724501a1581d267bd2ee426ce106')


build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}

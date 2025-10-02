#Maintainer: sukanka <su975853527 AT gmail.com>
_pkgname=jaspSummaryStatistics
_pkgver=0.95.3
pkgname=r-${_pkgname,,}
pkgver=0.95.3
pkgrel=1
pkgdesc="Summary Statistics Module for JASP"
arch=('any')
url="https://github.com/jasp-stats/${_pkgname}"
license=('GPL')
depends=(r
  r-bayesfactor
  r-bstats
  r-jaspbase
  r-jaspfrequencies
  r-jaspgraphs
  r-jaspregression
  r-jaspttests
  r-jaspanova
  r-jaspdescriptives
  r-suppdists
  r-bayesplay
)
groups=(r-jasp r-jaspextra)
source=("${_pkgname}_${_pkgver}.tar.gz::${url}/archive/refs/tags/v${_pkgver}.tar.gz")
sha256sums=('a24269d3c95b07028bb3e8b16170d21eeabef903fefa01f7b7a2be7eefe43c8e')


build() {

  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}

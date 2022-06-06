# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=IDPmisc
_pkgver=1.1.20
pkgname=r-${_pkgname,,}
pkgver=1.1.20
pkgrel=4
pkgdesc="'Utilities of Institute of Data Analyses and Process Design (www.zhaw.ch/idp)'"
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
optdepends=(
  r-swissair
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('bcb9cd7b8097e5089d1936286ef310ac2030ea7791350df706382ba470afc67f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

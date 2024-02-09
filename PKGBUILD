# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=IDPmisc
_pkgver=1.1.21
pkgname=r-${_pkgname,,}
pkgver=1.1.21
pkgrel=1
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
sha256sums=('478b95ae7e73df78e0728d37281b9af6b4f152a8d54bf9811121d32722f9088c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

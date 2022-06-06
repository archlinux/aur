# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=praznik
_pkgver=11.0.0
pkgname=r-${_pkgname,,}
pkgver=11.0.0
pkgrel=3
pkgdesc='Tools for Information-Based Feature Selection and Scoring'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
optdepends=(
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('c6d6ff8ad0c37dbc25d42dcf4c35dd0fdd6bff445176a71e7346e55974b165a1')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

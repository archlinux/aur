# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=conflicted
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=1.2.0
pkgrel=1
pkgdesc='An Alternative Conflict Resolution Strategy'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r
  r-cli
  r-memoise
  r-rlang
)
optdepends=(
  r-callr
  r-covr
  r-dplyr
  r-matrix
  r-methods
  r-pkgload
  r-testthat
  r-withr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('c99b86bb52da3e7d1f4d96d70c77304d0434db5bd906edd8d743e89ac9223088')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:

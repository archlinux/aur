# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=assertive.reflection
_pkgver=0.0-5
pkgname=r-${_pkgname,,}
pkgver=0.0.5
pkgrel=4
pkgdesc='Assertions for Checking the State of R'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-assertive.base
)
optdepends=(
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('c2ca9b27cdddb9b9876351afd2ebfaf0fbe72c636cd12aa2af5d64e33fbf34bd')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=randomizr
_pkgver=0.24.0
pkgname=r-${_pkgname,,}
pkgver=0.24.0
pkgrel=1
pkgdesc='Easy-to-Use Tools for Common Forms of Random Assignment and Sampling'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r
)
optdepends=(
  r-dplyr
  r-knitr
  r-ri
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('23e2c64669ea52c311f4ea45c1526d161c0fd7bd2aee108d23e10d44157c80e0')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:

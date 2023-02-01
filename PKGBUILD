# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Delaporte
_pkgver=8.1.0
pkgname=r-${_pkgname,,}
pkgver=8.1.0
pkgrel=1
pkgdesc='Statistical Functions for the Delaporte Distribution'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('BSD')
depends=(
  r
  gcc-fortran
)
optdepends=(
  r-covr
  r-tinytest
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('1934c0316cfba450af37ee9386857494337a28e2d259b8dfaf55cb6fdc415123')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:

# Maintainer: Hu Butui <hot123tea123@gmail.com>

_pkgname=collections
_pkgver=0.3.6
pkgname=r-${_pkgname,,}
pkgver=0.3.6
pkgrel=1
pkgdesc='High Performance Container Data Types'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r
)
optdepends=(
  r-covr
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('234fa5117108c6d1cb674cdf62f6a75e3efa14884193328cff009c6374b3c7a7')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:

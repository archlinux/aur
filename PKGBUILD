# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=shinytoastr
_pkgver=2.1.1
pkgname=r-${_pkgname,,}
pkgver=2.1.1
pkgrel=4
pkgdesc="Notifications from 'Shiny'"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r
  r-shiny
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('9618b16f6247e60ac9431d8c344f2469202d72eb7c7aaf64a6abf3e01ef94206')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:

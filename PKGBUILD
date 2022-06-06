# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=waiter
_pkgver=0.2.5
pkgname=r-${_pkgname,,}
pkgver=0.2.5
pkgrel=4
pkgdesc="Loading Screen for 'Shiny'"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r
  r-htmltools
  r-r6
  r-shiny
)
optdepends=(
  r-httr
  r-knitr
  r-packer
  r-rmarkdown
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('9ac25e979db9242598bd0492ff862360009b51ce672184ec9f4eeb2232164979')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:

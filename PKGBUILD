# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=phosphoricons
_pkgver=0.2.1
pkgname=r-${_pkgname,,}
pkgver=0.2.1
pkgrel=1
pkgdesc="'Phosphor' Icons for R"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r
  r-htmltools
)
optdepends=(
  r-covr
  r-shiny
  r-tinytest
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('b67ac6932d9c0b33c5866366ea0a2a8001cd6e4fb901eaf4fdbfd498007f245c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:

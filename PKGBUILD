# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=fauxpas
_pkgver=0.5.2
pkgname=r-${_pkgname,,}
pkgver=0.5.2
pkgrel=1
pkgdesc='HTTP Error Helpers'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r
  r-httpcode
  r-r6
  r-whisker
)
optdepends=(
  r-crul
  r-curl
  r-httr
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('84d07361a146b419cb1dcb7751654e3d5f159cf2704faf498e5ea56c8de61ef6')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:

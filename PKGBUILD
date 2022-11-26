# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=randomizr
_pkgver=0.22.0
pkgname=r-${_pkgname,,}
pkgver=0.22.0
pkgrel=6
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
sha256sums=('1c42d45e97aae63c4a80ae78f6c095d6d8195e18a53db0d76a17acd9070435bf')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:

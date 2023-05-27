# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=chk
_pkgver=0.9.0
pkgname=r-${_pkgname,,}
pkgver=0.9.0
pkgrel=1
pkgdesc='Check User-Supplied Function Arguments'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r
  r-lifecycle
  r-rlang
)
optdepends=(
  r-covr
  r-knitr
  r-rmarkdown
  r-testthat
  r-withr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('07e6f9bedd2443f0135493c2d22749817080040a76d61975914283dd37ce49ba')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:

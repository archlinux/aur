# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=chk
_pkgver=0.9.1
pkgname=r-${_pkgname,,}
pkgver=0.9.1
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
sha256sums=('f9b43dcf1002c6244dc87965f21dff6e65256eb634b826deb7b5cdfc26f505a7')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:

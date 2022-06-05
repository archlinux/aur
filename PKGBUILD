# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=attempt
_pkgver=0.3.1
pkgname=r-${_pkgname,,}
pkgver=0.3.1
pkgrel=4
pkgdesc='Tools for Defensive Programming'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r
  r-rlang
)
optdepends=(
  r-curl
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('15159d3d20198c6300874451e925ca154c23e0b6cdd7e05eaf98a3cbe4798ffa')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:

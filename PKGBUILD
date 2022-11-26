# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=latex2exp
_pkgver=0.9.5
pkgname=r-${_pkgname,,}
pkgver=0.9.5
pkgrel=3
pkgdesc='Use LaTeX Expressions in Plots'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r
  r-magrittr
  r-stringr
)
optdepends=(
  r-dplyr
  r-ggplot2
  r-htmltools
  r-knitr
  r-purrr
  r-rcurl
  r-reactable
  r-rlang
  r-rmarkdown
  r-testthat
  r-tibble
  r-waldo
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('8a42a7281b6736f9587b5443aa10e08b1823167f3c543821eed66eeafac86b94')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:

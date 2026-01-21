# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=latex2exp
_pkgver=0.9.8
pkgname=r-${_pkgname,,}
pkgver=0.9.8
pkgrel=1
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
sha256sums=('8dd641f263989515d0c327550934e4954dc582230ca2bb9f280b6b28a46510a5')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:

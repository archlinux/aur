# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=latex2exp
_pkgver=0.9.6
pkgname=r-${_pkgname,,}
pkgver=0.9.6
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
sha256sums=('669826a433a1d815c9164ffcb69d7d634857be905e3c8c04f464cf1221a0e0ca')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:

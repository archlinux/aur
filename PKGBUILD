# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=latex2exp
_pkgver=0.9.4
pkgname=r-${_pkgname,,}
pkgver=0.9.4
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
  r-ggplot2
  r-knitr
  r-plyr
  r-purrr
  r-rmarkdown
  r-testthat
  r-tibble
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('85a49efd42d31986c2faaf191d0a2be7695d26d618c9314ebd9488f2deca6b7d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:

# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ggside
_pkgver=0.2.0
pkgname=r-${_pkgname,,}
pkgver=0.2.0
pkgrel=4
pkgdesc='Side Grammar Graphics'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r
  r-ggplot2
  r-glue
  r-gtable
  r-rlang
  r-scales
)
optdepends=(
  r-dplyr
  r-ggdendro
  r-knitr
  r-rmarkdown
  r-testthat
  r-tidyr
  r-vdiffr
  r-viridis
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('eadb42b5c598cf526a9833eb96608790adc144da45a6db6f310e9efde32fa0f4')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:

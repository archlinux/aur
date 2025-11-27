# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ggside
_pkgver=0.4.1
pkgname=r-${_pkgname,,}
pkgver=0.4.1
pkgrel=1
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
  r-tibble
  r-vctrs
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
sha256sums=('46199c1e2f0e5e50de40d7e83bb3c64528e55d3d5f556fca0c83ecbc5a8a2777')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:

# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ggside
_pkgver=0.3.2
pkgname=r-${_pkgname,,}
pkgver=0.3.2
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
sha256sums=('6a74bf050ec745d449861ba01775436ab4c490e150272b0d2ea25b65d5391a7d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:

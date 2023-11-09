# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ggformula
_pkgver=0.12.0
pkgname=r-${_pkgname,,}
pkgver=0.12.0
pkgrel=1
pkgdesc='Formula Interface to the Grammar of Graphics'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r
  r-ggforce
  r-ggplot2
  r-ggridges
  r-ggstance
  r-labelled
  r-magrittr
  r-mosaiccore
  r-rlang
  r-scales
  r-stringr
  r-tibble
)
optdepends=(
  r-broom
  r-covr
  r-dplyr
  r-ggplot2movies
  r-ggthemes
  r-interp
  r-knitr
  r-lattice
  r-lubridate
  r-maps
  r-maptools
  r-mosaic
  r-mosaicdata
  r-palmerpenguins
  r-purrr
  r-quantreg
  r-rgeos
  r-rmarkdown
  r-sf
  r-survival
  r-testthat
  r-tidyr
  r-vdiffr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('d569f83e059f9e4836bd513f92706fb8a614300f744dcc47bf86e8dafd8e776d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:

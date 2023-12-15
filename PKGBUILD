# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_pkgname=cowplot
_pkgver=1.1.2
pkgname=r-${_pkgname,,}
pkgver=1.1.2
pkgrel=1
pkgdesc="Streamlined Plot Theme and Plot Annotations for 'ggplot2'"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-ggplot2
  r-gtable
  r-rlang
  r-scales
)
optdepends=(
  r-cairo
  r-covr
  r-dplyr
  r-forcats
  r-gridgraphics
  r-knitr
  r-lattice
  r-magick
  r-maps
  r-paswr
  r-patchwork
  r-ragg
  r-rmarkdown
  r-testthat
  r-tidyr
  r-vdiffr
  r-venndiagram
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('c6915d091476d43303587d846d96348b7ac48b6c3f1e84bf092a7dbcf278fade')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

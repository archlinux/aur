# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ontologyPlot
_pkgver=1.6
pkgname=r-${_pkgname,,}
pkgver=1.6
pkgrel=4
pkgdesc='Visualising Sets of Ontological Terms'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-ontologyindex
  r-paintmap
  r-rgraphviz
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('41a601e2201f32673c6830adc770a877be1ba4003b7352d4c09c8c50a3e8a158')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

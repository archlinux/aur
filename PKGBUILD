# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=multipanelfigure
_pkgver=2.1.2
pkgname=r-${_pkgname,,}
pkgver=2.1.2
pkgrel=8
pkgdesc='Infrastructure to Assemble Multi-Panel Figures (from Grobs)'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-assertive.base
  r-assertive.files
  r-assertive.numbers
  r-assertive.properties
  r-assertive.types
  r-ggplot2
  r-gridgraphics
  r-gtable
  r-magick
  r-magrittr
  r-stringi
)
optdepends=(
  r-complexheatmap
  r-grdevices
  r-knitr
  r-lattice
  r-markdown
  r-rmarkdown
  r-roxygen2
  r-venndiagram
)
source=("https://cran.r-project.org/src/contrib/Archive/${_pkgname}/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('eca98888d2f7c8887764443633bd557e9100f73694b2e5df68a63b304f5ba532')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

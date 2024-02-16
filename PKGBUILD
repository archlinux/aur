# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=PhyloProfile
_pkgver=1.16.2
pkgname=r-${_pkgname,,}
pkgver=1.16.2
pkgrel=1
pkgdesc='PhyloProfile'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-ape
  r-biocstyle
  r-biodist
  r-biostrings
  r-colourpicker
  r-data.table
  r-dt
  r-energy
  r-experimenthub
  r-ggplot2
  r-gridextra
  r-omadb
  r-pbapply
  r-plyr
  r-rcolorbrewer
  r-rcurl
  r-shiny
  r-shinybs
  r-shinycssloaders
  r-shinyfiles
  r-shinyjs
  r-stringr
  r-xml2
  r-yaml
  r-zoo
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('92f92d1ff383b425d9c7b20cd220a6dff0009b4d7eb5fbb25fd1ce1027c5d640')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:

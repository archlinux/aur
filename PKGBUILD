# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=PhyloProfile
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=1.12.0
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
  r-shinyjs
  r-xml2
  r-yaml
  r-zoo
  r-shinyfiles
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('3c8a9659cd7caca192332bea6f7cbd0469b24aacde07681356a6a93bc9ba942c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:

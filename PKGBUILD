# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GEOexplorer
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=1.2.0
pkgrel=1
pkgdesc='GEOexplorer: an R/Bioconductor package for gene expression analysis and visualisation'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biobase
  r-dt
  r-factoextra
  r-geoquery
  r-ggplot2
  r-heatmaply
  r-htmltools
  r-impute
  r-limma
  r-maptools
  r-pheatmap
  r-plotly
  r-scales
  r-shiny
  r-shinybs
  r-shinybusy
  r-shinyheatmaply
  r-stringr
  r-umap
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-testthat
  r-usethis
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('af6172c5ee4c544331a123e14cbff43a171c41b8c3c77c8e8a106d7bc0cd9602')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=bioCancer
_pkgver=1.30.6
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Interactive Multi-Omics Cancers Data Visualization and Analysis"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('AGPL-3.0-only AND CC-BY-NC-SA-4.0')
depends=(
  r-algdesign
  r-annotationdbi
  r-biobase
  r-cbioportaldata
  r-clusterprofiler
  r-diagrammer
  r-dose
  r-dplyr
  r-dt
  r-genetclassifier
  r-go.db
  r-htmlwidgets
  r-import
  r-org.bt.eg.db
  r-org.hs.eg.db
  r-plyr
  r-r.methodss3
  r-r.oo
  r-radiant.data
  r-reactome.db
  r-reactomepa
  r-shiny
  r-shinythemes
  r-tibble
  r-tidyr
  r-visnetwork
  r-xml
)
optdepends=(
  r-biocstyle
  r-knitr
  r-prettydoc
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('fcc20bea86327fe2896616cfc98d6241')
b2sums=('ec008f241cef4901d4d4ec528d3ddbb217a5efc0f4f920912085ca67e549fb280bc234ab0aec0cc7174a0fffcc70b1cbd650daafd9834999cef29bb3cbf5017c')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=bioCancer
_pkgver=1.30.7
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
md5sums=('793b22fe3fa243c0e4ce64bd9b9c4fee')
b2sums=('3d0bedbe89ff516c1c408f00b15d372a69254ab7c6b0db1fcfb9dcc8da8acf2ddeba1e762f482f06f4fd300c01bc7b2f314e8d39347d144c1542bd6a8e665fb9')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

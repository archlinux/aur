# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=bioCancer
_pkgver=1.32.0
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
md5sums=('2b99f3a77d12327a1ff0656d2e029067')
b2sums=('f5695b57e6537ca0003880f00a4be08a805667568c99fd053ca204fc27e787108a85aa8cd84be25887c531a6e701647ac67cf3c3bc4f2e0b7b2d2055a770e8f0')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

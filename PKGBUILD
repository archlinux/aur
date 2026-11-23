# Maintainer: Guoyi <kuoi@bioarchlinux.org>

_pkgname=dartR.sim
_pkgver=1.3.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//[:-]/.}
pkgrel=1
pkgdesc="Computer Simulations of 'SNP' Data"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL-3.0-or-later')
depends=(
  r-adegenet
  r-dartr.base
  r-dartr.data
  r-data.table
  r-fields
  r-ggplot2
  r-hierfstat
  r-rcpp
  r-shiny
  r-shinybs
  r-shinyjs
  r-shinythemes
  r-shinywidgets
  r-stringi
  r-doparallel
  r-ggrepel
  r-foreach
  r-dplyr
  r-dartr.popgen
  r-bigsnpr
)
optdepends=(
  r-bigstatsr
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('0dbf733e1fef724ce0c86e92ba6cce55')
b2sums=('f2946d7cac74c2bf63400785c11e52e976eee9b2f233455a03fd0e3ac2252f40335a2c4b467454ad22ee4e5e6716a1530ba33f5dc020ff855922169bbbd6ebb7')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ModCon
_pkgver=1.22.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Modifying splice site usage by changing the mRNP code, while maintaining the genetic code"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only AND LGPL-3.0-only')
depends=(
  perl
  r-data.table
)
optdepends=(
  r-dplyr
  r-knitr
  r-rmarkdown
  r-shiny
  r-shinycssloaders
  r-shinydashboard
  r-shinyfiles
  r-shinyjs
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('11fbcc0671b4648b6a28c43d06af245f')
b2sums=('3c364fb206f5d7d978717c7ab43de0dc364cfe86dd5507ccfd23a6169aeb022e20ea31e3fbc525d90ef44b352b30ca2d314a148b5072a92f2ec36713625f49d6')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

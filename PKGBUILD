# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rols
_pkgver=3.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="An R interface to the Ontology Lookup Service"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-biobase
  r-biocgenerics
  r-httr2
  r-jsonlite
)
optdepends=(
  r-biocstyle
  r-dt
  r-go.db
  r-knitr
  r-lubridate
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('9c1beb504babe3acffd9e146fbac31e5')
b2sums=('5d1e8777e0f07ae796cf834842a8c398ec84485dbb9751c84a9e2561ba2ae090bab4ec7582712c51096f3a520011301006827f51608d13fbfe5ea5639ab9815e')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

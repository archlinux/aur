# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rols
_pkgver=3.8.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="An R interface to the Ontology Lookup Service"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-biobase
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
md5sums=('18372540b82273afa929ba5bda88455b')
b2sums=('c9add54fa0a5afb2f0d4bab2c6ab758c3680208c1498546ca47f43dc732e28d39273f9765ebca81be68a8ef94138ef7df01794ce3d74caa430db1683efe09aff')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

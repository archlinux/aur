# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=ReUseData
_pkgver=1.2.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Reusable and reproducible Data Management"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-basilisk
  r-biocfilecache
  r-jsonlite
  r-rcwl
  r-rcwlpipelines
  r-s4vectors
  r-yaml
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('c0041ec5d810d0d043c7375e04e78c06')
b2sums=('994e05474d8b9b21045c24b1900055009135f5b5cf8e0d362b15175f719c3cdba80633092cdc9ef8fc26f101cd9f2ef1577560263f7a31727494e43cb330f6d3')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

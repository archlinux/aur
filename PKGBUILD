# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=rjsoncons
_pkgver=1.3.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Query, Pivot, Patch, and Validate 'JSON' and 'NDJSON'"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('BSL-1.0')
depends=(
  r-cli
  r-tibble
)
makedepends=(
  r-cpp11
)
optdepends=(
  r-biocstyle
  r-jsonlite
  r-knitr
  r-rmarkdown
  r-tinytest
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('e07900e0f6caaeceb1774066cb2e8281')
b2sums=('8ff6450449272b195d198318e2b1b860c14101ca2880aaa56ee9c1384cdf89badd415c9dcc61db4d2176de690e04d13c99025e8c06cd12b56f0d4f2f5093f0d6')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

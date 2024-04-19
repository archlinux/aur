# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=rjsoncons
_pkgver=1.3.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Query, Pivot, Patch, and Validate 'JSON' and 'NDJSON'"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('BSL-1.0')
depends=(
  r-cli
)
makedepends=(
  r-cpp11
)
optdepends=(
  r-biocstyle
  r-jsonlite
  r-knitr
  r-rmarkdown
  r-tibble
  r-tinytest
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('c0eaef19307c6f993d1473293e0c873e')
b2sums=('a6be97be3b706965c99b66b10c730d40702392794b038eb7d6fba10f3d6332d04959e1bf1382229f75a2346634d47c0cb29ab4e51d91c9d4e52b7490609b9c2c')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

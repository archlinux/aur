# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=rjsoncons
_pkgver=1.3.2
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
md5sums=('27567b3c02ffcddcdc6a4ab8cb95e97f')
b2sums=('320d3ae7b52dd521768b636359fcb3eb9dbc3b36cdfe1cb70828e81bb43f777f0fb95166ba4f1637fd3548d0e3d8fcd5981bce43b7a2c8a81e9a108b15d7dcca')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=rjsoncons
_pkgver=1.3.3
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
md5sums=('d6a0348d2d11a62738667c1770e332c0')
b2sums=('1615905378fefa109a8e5d74d79ec0edc3c38b561f657c0bbd759501d1f1f05eebaefcd421c641aac6dd7f8899728cd1ab29fc5f293560af3493ff90b229f944')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

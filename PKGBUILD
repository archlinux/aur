# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=httpgd
_pkgver=2.0.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A 'HTTP' Server Graphics Device"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-unigd
)
makedepends=(
  r-asioheaders
  r-cpp11
)
optdepends=(
  r-covr
  r-future
  r-httr
  r-jsonlite
  r-knitr
  r-rmarkdown
  r-testthat
  r-xml2
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('2c18e37c6f9c36f743ce8b467ab370cd')
b2sums=('5b40d65f133c5cda3c251478d643b747a0b4b048a0dacbd0be94271b021d898353d57270df601102dbfbcf4aaac471dd0c39f013393e3e37adafebce49d40f7e')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

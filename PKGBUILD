# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=httpgd
_pkgver=2.0.2
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
md5sums=('509eda2881ff22c6b8f54428ec815aa1')
b2sums=('bfe1a089cc41ed0177f21a9d6a50cbc604346b2f9bddc6d960e826ee438904d32a7bf7b0e01fd07f9aa2fd5b067d59a6ada4273c7482e25170257286479218bc')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

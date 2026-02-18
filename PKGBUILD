# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=airr
_pkgver=1.6.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="AIRR Data Representation Reference Library"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('CC-BY-4.0')
depends=(
  r-jsonlite
  r-readr
  r-stringi
  r-yaml
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-testthat
  r-tibble
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('c25f2f8832be3a6a1945f2b629fbd31b')
b2sums=('864f2fa7d0475721a0580167a7bdde198048c764bdd7d2cc90b79630d0f5fca90af466c82545235a0b54ec7db66ad849328a048bf2c02629a766351d6d9b906a')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

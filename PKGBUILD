# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=airr
_pkgver=1.5.0
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
md5sums=('9e4729ed604fc3d017223dc675504fb9')
b2sums=('36349b4a789aef3bab66efad7ef24401625b9cb34ecfc996754e0025a0b3f9b1ca9710403bd79fcf1a37c577a72c292f216499f87476b61d155191355db5656c')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

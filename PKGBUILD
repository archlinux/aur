# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=memisc
_pkgver=0.99.31.8
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Management of Survey Data and Presentation of Analysis Results"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only OR GPL-3.0-only')
depends=(
  r-data.table
  r-jsonlite
  r-yaml
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-sandwich
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('50e3492635686382d2f2dc6ae39d92a7')
b2sums=('cc06788e9626dd2479b70d47ab9c28c8662694235cfe45750b56116fed424f2f9ad90c3bafeb0664a0a57ba86694adbac6f9be1f0d0e5fa3ccedeb4fa9a6d567')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

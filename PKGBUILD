# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=memisc
_pkgver=0.99.31.7
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
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
md5sums=('29549169c78c37545bb79bb7ac4753c9')
b2sums=('f78fd33f467d6ccfe234e96fb00cea84c91644c0feb02415c75a56f545564ef575edc75115461f8cdc12eb0f9888a01f66bf2f852bcfbc6af6eb70c8bbd8e34d')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

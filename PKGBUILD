# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=memisc
_pkgver=0.99.31.7
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Management of Survey Data and Presentation of Analysis Results"
arch=(x86_64)
url="https://cran.r-project.org/package=${_pkgname}"
license=(GPL)
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
sha256sums=('b403185850520db18ebd608df85c76df80e6c64af428cdc4e49c2fe487483637')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

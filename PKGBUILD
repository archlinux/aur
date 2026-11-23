# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=ggimage
_pkgver=0.3.8
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Use Images in 'ggplot2'"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('Artistic-2.0')
depends=(
  r-digest
  r-ggfun
  r-ggiraph
  r-ggplot2
  r-ggplotify
  r-jsonlite
  r-magick
  r-purrr
  r-rlang
  r-scales
  r-tibble
  r-withr
  r-yulab.utils
)
optdepends=(
  r-httr
  r-quarto
  r-rsvg
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('bda424d16b4875797f75001b1c34b482')
b2sums=('f9cc08aa0d8003722572ca9df855f98decac85ccce1c8b254d57f2c724780a25ae45c30a0a1dd4faf0eb419995ac7fe1c2017849420d91bb909037df809f6329')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

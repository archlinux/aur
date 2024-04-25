# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=ggimage
_pkgver=0.3.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Use Image in 'ggplot2'"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('Artistic-2.0')
depends=(
  r-ggfun
  r-ggplot2
  r-ggplotify
  r-jsonlite
  r-magick
  r-scales
  r-tibble
  r-withr
)
optdepends=(
  r-ape
  r-ggtree
  r-gridgraphics
  r-httr
  r-rsvg
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('8885f142e42910a64e8b8906cb8dd3a9')
b2sums=('5f3c84892ad6716c497a1cad22ef1abd4138b62f0c8e1987c2ec76aa6945c9e8da7ff26b12083cda5aef24acc852de369383f7879dced6ef4db244573eee654c')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

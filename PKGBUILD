# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=ggimage
_pkgver=0.3.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Use Image in 'ggplot2'"
arch=(any)
url="https://cran.r-project.org/package=${_pkgname}"
license=(Artistic2.0)
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
sha256sums=('7a85a5500e982478f21de1e87394fa0ab7037417d8c0c9b38bda5a8b9b09a34a')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

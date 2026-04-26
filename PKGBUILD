# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=ggimage
_pkgver=0.3.5
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
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
  r-yulab.utils
  r-purrr
  r-digest
  r-ggiraph
  r-rlang

)
optdepends=(
  r-ape
  r-ggtree
  r-gridgraphics
  r-httr
  r-rsvg
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('62987c383b09c00104c8458bcc51988f')
b2sums=('3844703440406729e6df95fccb3ea23e79d326eee643344745c047bcddee74ce37395a7c02fbe2a146518c2d0c0c0d26e2e05800b14b3fe5a72bf29b8e12e8f0')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

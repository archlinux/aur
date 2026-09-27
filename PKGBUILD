# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=ggimage
_pkgver=0.3.6
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Use Image in 'ggplot2'"
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
  r-ape
  r-ggtree
  r-gridgraphics
  r-httr
  r-rsvg
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('f23d5b0043616481e9609f2f2917d6e0')
b2sums=('37c5930c1d4315bba1a729ac77cab026127a2a08919aec5f3fa14ed49d6b5991fa52605b25f379b78ed3246a3a8f38474fba4e989cd0f4ff4f63fbbcbd741815')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

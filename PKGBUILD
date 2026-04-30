# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=BiocHail
_pkgver=1.11.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="basilisk and hail"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-basilisk
  r-biocfilecache
  r-biocgenerics
  r-dplyr
  r-reticulate
)
optdepends=(
  r-biocstyle
  r-dt
  r-ggplot2
  r-knitr
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('9b013cde48925de9108439a0aae58555')
b2sums=('3b3ff594934d2876dc5b6bcc1d5e8d270101a82a876bf94c3690b467173c65367fdf91970f0694c54d4dd05cf407d4024cacd4d035b6258809d9c23c8e854c51')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

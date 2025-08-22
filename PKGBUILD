# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ggfun
_pkgver=0.2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Miscellaneous Functions for 'ggplot2'"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('Artistic-2.0')
depends=(
  r-cli
  r-dplyr
  r-ggplot2
  r-rlang
  r-scales
  r-yulab.utils
)
optdepends=(
  r-ggnewscale
  r-ggplotify
  r-knitr
  r-prettydoc
  r-rmarkdown
  r-tidyr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('9bc035d0afa723a1a0dff35dd54a060b')
b2sums=('6e59dc27344834e34d3bd12ba45562c2c4987c7964a52d72a5f78e0197c563619e1156d50c31a23707a328b9843f5a518da91c0ad1d81ae9cdc0c4484411ff39')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

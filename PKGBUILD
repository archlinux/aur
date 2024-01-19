# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ggfun
_pkgver=0.1.4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Miscellaneous Functions for 'ggplot2'"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('Artistic-2.0')
depends=(
  r-cli
  r-ggplot2
  r-rlang
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
md5sums=('a27e5e2c026eba828b588bb230db3ea3')
b2sums=('ca4cd76bcb9bc640984bd258d199f045e88d0b79cc1c083d7d2c777f58f005381a78851ef35f83c3f3d64c590253a19cf9668df0d1c0e1b98a0a5e51abe9abf4')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

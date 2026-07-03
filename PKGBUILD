# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ggfun
_pkgver=0.2.1
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
  r-pkgload
  r-quarto
  r-testthat
  r-tidyr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('78cdc8ca2371fa220c44ba471d8e67a1')
b2sums=('f2a1c1d496dd2628b2d4bc75b00b4a47df0f4f364c039db3ecb3c63a9f8bd9e73458faca3f6841ac2b7354ec328a6d24568936e1357b75502ff2dcf035dcc8d8')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

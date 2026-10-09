# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ggfun
_pkgver=0.2.2
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
md5sums=('04814613a86523a50ff46897742ab1ff')
b2sums=('c0eec2d48b7d27029d4ea5fe4f5397192b34e00ecaa8f778d0f7d232dd0c0a902d402c7538038b056451da0ef54531c0ce5ea7b13885537cb11285d27cc3e0e7')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

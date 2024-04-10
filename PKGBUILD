# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=directlabels
_pkgver=2024.1.21
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=4
pkgdesc="Direct Labels for Multicolor Plots"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-quadprog
)
optdepends=(
  r-alphahull
  r-dplyr
  r-ggplot2
  r-ggthemes
  r-inlinedocs
  r-knitr
  r-lars
  r-latticeextra
  r-markdown
  r-rcolorbrewer
  r-rlang
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('7b77108461c30d70d2aff70222d5a730')
b2sums=('340e48ebb417695b20c9d0cee498f0c8896dcb63fcf7748afeaa4fae0726e46917c6eecb050f5969921c1b62983310f1d5d5ba0bef9ef2ea8cfc079203bf87d1')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

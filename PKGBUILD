# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=multipanelfigure
_pkgver=2.1.6
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Infrastructure to Assemble Multi-Panel Figures (from Grobs)"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-or-later')
depends=(
  r-ggplot2
  r-gridgraphics
  r-gtable
  r-magick
  r-magrittr
  r-stringi
)
optdepends=(
  r-complexheatmap
  r-knitr
  r-markdown
  r-rmarkdown
  r-roxygen2
  r-venndiagram
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('d484d23f1bf53f54bb3c9bfa635425fc')
b2sums=('e5d1cfae80818f7b67d1a36e95a69b8534449fb9c79c1120bfbf852edd6ea55571f84c56c86826a406e27bf51f62b2b680cb7e22b31deda2e80459617ef760a7')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

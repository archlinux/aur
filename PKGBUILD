# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=multipanelfigure
_pkgver=2.1.5
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Infrastructure to Assemble Multi-Panel Figures (from Grobs)"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-or-later')
depends=(
  r-assertive.base
  r-assertive.files
  r-assertive.numbers
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
md5sums=('e80c2af7114635a3cf1d01adf7d0207e')
b2sums=('730435fc8dd88ba096bafa7f2d8474cb2b99f361ef2353a0ad144602942709629e83c95c3b887fb5fc3b368eb7de2cbe62606e85e5376f29f472e3b32f92e5d6')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ggplotify
_pkgver=0.1.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Convert Plot to 'grob' or 'ggplot' Object"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('Artistic-2.0')
depends=(
  r-ggplot2
  r-gridgraphics
  r-yulab.utils
)
optdepends=(
  r-aplot
  r-colorspace
  r-cowplot
  r-ggimage
  r-knitr
  r-prettydoc
  r-rmarkdown
  r-vcd
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('3bd4a51a0406a4b44f456aa75a8093df')
b2sums=('7c6a1c21ddbaced450fa0bf4edc0210211cbaa951d6535e3118ade4a193092964fef2474c79d15b74121dc1b552fba06f6a49c80e2e1570f957a8b933c4d3d1a')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

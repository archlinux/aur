# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ggplotify
_pkgver=0.1.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Convert Plot to 'grob' or 'ggplot' Object"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('Artistic-2.0')
depends=(
  r-ggplot2
  r-gridgraphics
  r-rlang
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
md5sums=('06f2d2b9f042fac7f4521b71a5ae49d9')
b2sums=('214771421bd402b3f964fdae16f362deca56a9fc350af58353b430f45d886f2ee47ed2dc31ddab48530ca3d236f8bb19c2cb80e24a703a26e4b09c8903307d46')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

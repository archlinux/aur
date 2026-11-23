# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ggplotify
_pkgver=0.1.4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Convert Almost Any Plot to a 'grob' or 'ggplot' Object"
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
  r-ggimage
  r-knitr
  r-patchwork
  r-quarto
  r-testthat
  r-vcd
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('39ec8abde205bdc56ceb6554fe0e4186')
b2sums=('81a1911e7c8d27ef8add8807d0bdc356e76f2716b4244fb87fbb91737396f817b3c4bf6d10010c0e5cbc12c6ee59020c893ba7e833aaf87f0e257976dd5689fa')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

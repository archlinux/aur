# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=tensor
_pkgver=1.5.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Tensor Product of Arrays"
arch=('any')
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('bd550e30b1f17722a87feec6f88b393e')
b2sums=('35c2f19ad6bcd64a9cd13170792f3ec0c87acd793098c9d86512680625c102826d940bca121745362b6195a6a880bfede19cc58aebd95117b7cc12cffa6c1a37')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

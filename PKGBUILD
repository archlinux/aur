# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=aplot
_pkgver=0.2.4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Decorate a 'ggplot' with Associated Information"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('Artistic-2.0')
depends=(
  r-ggfun
  r-ggplot2
  r-ggplotify
  r-magrittr
  r-patchwork
)
optdepends=(
  r-ggtree
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('2f78a1f399fe91d213e9ece15a403a94')
b2sums=('34a49640c70cbf462139ed423217daa3391a495199c45a6fc647b338000bba3faff40e9a2f0acbc3923ba448c4821ffb240f3e58c487adfa86302a5effecfc6b')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Phil Schaf <flying-sheep@web.de>

_pkgname=GeneNet
_pkgver=1.2.17
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Modeling and Inferring Gene Networks"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-or-later')
depends=(
  r-corpcor
  r-fdrtool
  r-longitudinal
)
optdepends=(
  r-graph
  r-rgraphviz
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('3ab16a153adafe2897fc2b2116fdeae3')
b2sums=('cef38846011e3f18f27f47d92ffbbf94df0c658a0636229bc171e3b690e78bd09a94dad2f8ca47d542da6f19e9a19ae04a94055fb8c69ab9fbe4a8fc97a82f98')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

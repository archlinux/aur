# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Phil Schaf <flying-sheep@web.de>

_pkgname=GeneNet
_pkgver=1.2.16
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=8
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
md5sums=('8547162999d1f2af1cf03389f2b27a57')
b2sums=('80b80557c10e081219013509498deea3d72448c4226d19912a9206b9db633756f1dc6e1fa7ed63f593cceb4330aecf1c38263f5d7adc8d4e03a6572997d25969')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

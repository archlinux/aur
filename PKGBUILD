# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=gamlss.dist
_pkgver=6.1-11
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Distributions for Generalized Additive Models for Location Scale and Shape"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only OR GPL-3.0-only')
depends=(
  r
)
optdepends=(
  r-distributions3
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('c7d01e39113bd8c7ce13c98f30fdb407')
b2sums=('a134de5904e3fc067d3d373113418595d31383633c76b7330c4fcf0ba7687c7243aa5513574cf4b2812386c7ed4f221833d3c8d9faaae466f75245aa68491940')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

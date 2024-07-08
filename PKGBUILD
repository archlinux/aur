# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=betareg
_pkgver=3.2-0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Beta Regression"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only OR GPL-3.0-only')
depends=(
  r-flexmix
  r-formula
  r-lmtest
  r-modeltools
  r-sandwich
)
optdepends=(
  r-car
  r-distributions3
  r-numderiv
  r-partykit
  r-statmod
  r-strucchange
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('f0ff3dc355f20716df7e51a0e507a02b')
b2sums=('6304c6dff3dd35d9bf8cc6a4c96084a1a7d79065494b7ae541ba5a7aabb63fb1e542e2439ca87780311c4046618e2087bbc4e5422335e4d83aa52d211b424b3b')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=betareg
_pkgver=3.2-2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
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
  r-knitr
  r-numderiv
  r-partykit
  r-quarto
  r-statmod
  r-strucchange
  r-bamlss
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b8b4eec4177085afb375209e1d384b74')
b2sums=('e155998a9e25c8713ba05c1e8154246eb6c1e768ceee415ab5bd3614a91638882dacc7d748b2c5fb95c97bae6b7ff5de00dbd4fe6a0089b653ac5318ff7d1f46')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

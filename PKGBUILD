# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=RSKC
_pkgver=2.4.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Robust Sparse K-Means"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-flexclust
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('5eb06b076dd9dfefb4d5a214b24a60e4')
b2sums=('5639df8e0d3de161647b632bf1d77959cbb87a88931a56e464d22153d01e6ee18a7ebec8f544182a4cb541f1b4ab9ac0465e0074d36823b19d05665f1a0969ae')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

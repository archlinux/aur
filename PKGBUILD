# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=FNN
_pkgver=1.1.4.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Fast Nearest Neighbor Search Algorithms and Applications"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
optdepends=(
  r-chemometrics
  r-mvtnorm
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('92df8f0a011ef9795b31b62450304b4e')
b2sums=('2bf5b5c4b55b24d0623416d76e16879f53a9004a955f9f093a1fbb769ac9c85998abb9648c9100a033a02e96fe838765e809050a9890bfbd7be6c785565749bf')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Kiri <kiri@vern.cc>

_pkgname=PMCMR
_pkgver=4.4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=4
pkgdesc="Calculate Pairwise Multiple Comparisons of Mean Rank Sums"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-or-later')
depends=(
  r
)
optdepends=(
  r-multcompview
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('17b1b0e928c7cb8bf4b376d46de90327')
b2sums=('8015b1d8647cee9c11c857053790e1ef847da84218cc2b65d7148a506440b3a17e8f0fc84710fed0177210b84ded0ab50ca37ad23c9926b7841efa871ef55508')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

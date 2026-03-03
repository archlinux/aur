# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DDRTree
_pkgver=0.1.6
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Learning Principal Graphs with DDRTree"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('Artistic-2.0')
depends=(
  r-irlba
  r-rcpp
)
makedepends=(
  r-bh
  r-rcppeigen
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('5ea110db9072407e5cd4b08364120b3c')
b2sums=('f136b21024a029e05ce510a582086fcd2c0477385b96e4fba82410ed01b7eb2a050778a8f62b7d21fd7867e7bffeb2032de517e05ad4b684a5fb4cb41aca6c92')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MultiMed
_pkgver=2.24.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Testing multiple biological mediators simultaneously"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
optdepends=(
  r-biocgenerics
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('019bc5d7be15d1688b3b5df7b87246f7')
b2sums=('abf84800287a29ffbe27511e4cdeb0cc9bffb8e744cd03e6517e80d27a6ed7482e7a899b1c0739a8d2a3cb7ce2732cfdf151de4ac0ed29aa60372ec231b00afe')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

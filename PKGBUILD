# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=JASPAR2016
_pkgver=1.42.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Data package for JASPAR 2016"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b7fcde3f672f2ea2eff159518d52d8c2')
b2sums=('d054799ae1f40ec0429802eefdc858830a8ddb2af08e894f89f5600c45d53ffda8516104aa5e3f76af47a24bc2a64a2509b21ba6808b1329f54410eba97eba30')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

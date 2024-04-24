# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=oompaBase
_pkgver=3.2.9
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Class Unions, Matrix Operations, and Color Schemes for OOMPA"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('Apache-2.0')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('e4697828589889278211385df36c0dcc')
b2sums=('933a5e6b281715077ee7f78b079b20e78c1c0db278c91e775fab669829bae7b551fbc627bbb6df30ce03fba68cc745744208c54fbb3da8e5b4c4616eb2b20baa')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

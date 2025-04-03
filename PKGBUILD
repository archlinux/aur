# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=oompaBase
_pkgver=3.2.10
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Class Unions, Matrix Operations, and Color Schemes for OOMPA"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('Apache-2.0')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('25817e7f83d2b2ccbfa80be999514411')
b2sums=('1962557b9001dbc1f0c243535e6a445dbee24f659d79e3829fe68c0cc41aa7ddf9906a076e2ed75025f7d1ee0a8bf98d118c4d867dc6b001b40af6f01d2c9779')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

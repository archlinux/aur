# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=deming
_pkgver=1.4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Deming, Theil-Sen, Passing-Bablock and Total Least Squares Regression"
arch=(any)
url="https://cran.r-project.org/package=${_pkgname}"
license=(LGPL)
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('d63daf672291763deca4518eb39f7be2')
sha256sums=('4190b5d9b6a76cbb33c24f3c1d291e416526fc610f3f10f5c3579a1957c6a3fb')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=robumeta
_pkgver=2.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Robust Variance Meta-Regression"
arch=(any)
url="https://cran.r-project.org/package=${_pkgname}"
license=(GPL2)
depends=(
  r
)
optdepends=(
  r-clubsandwich
  r-r.rsp
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('8f80a79fc262c49172df2bcf78e3e1e3')
sha256sums=('d3cf9a2ee5d7383953b7f9393c290ff8005776e5df471cc14d3fd870cdc0cbd3')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

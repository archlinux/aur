# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=dfidx
_pkgver=0.0-5
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Indexed Data Frames"
arch=(any)
url="https://cran.r-project.org/package=${_pkgname}"
license=(GPL)
depends=(
  r-dplyr
  r-formula
)
optdepends=(
  r-aer
  r-knitr
  r-mlogit
  r-plm
  r-rmarkdown
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('26d1468f30c4c3d98a1251f427937c63')
sha256sums=('37521940b35d62773a4d127c94148aadf207f400a686f2212a22d96e53086a0a')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

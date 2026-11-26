# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=dartRverse
_pkgver=1.3.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Install and Load the 'dartRverse' Suits of Packages"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-or-later')
depends=(
  r-biocmanager
  r-cli
  r-httr
  r-remotes
  r-rlang
)
optdepends=(
  r-dartr.base
  r-dartr.captive
  r-dartr.data
  r-dartr.popgen
  r-dartr.sexlinked
  r-dartr.sim
  r-dartr.spatial
  r-testthat
  r-withr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('a132175ab19aaf10b4033a4230c76b33')
b2sums=('752976f6109592149f559b4bfeb0f7711ea064f50840d3921b7c7e261aeaedb528f2a6c71e2eb62d6dcb436518bed3409401f9cde28f7aecfa6ffab1f18ca2ef')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=unitizer
_pkgver=1.4.20
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Interactive R Unit Tests"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only OR GPL-3.0-only')
depends=(
  r-crayon
  r-diffobj
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('a0e2e77bc73d40eff1e07cd684a16e80')
b2sums=('358439c99bd1a389ffd29076d26ced9a57f07f30383b29efb1df308fcf44ecec755afb1885a6058d68f173f6a6207b12c0304c2fc5d8681986360e485efd651b')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

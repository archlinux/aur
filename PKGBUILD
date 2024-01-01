# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=MUS
_pkgver=0.1.6
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Monetary Unit Sampling and Estimation Methods, Widely Used in Auditing"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=(GPL)
depends=(
  r
)
optdepends=(
  r-desctools
  r-pander
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('ff9dda815a29881a16a55986440bdd96')
b2sums=('4317364996569fa864240d94622e8bf71ea3834656c2ee72bb4fd7b3ba336f8e62436e61f3c0292a105b456acaeda6fa3fc658531fd301b68d873fedb6c7e39f')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

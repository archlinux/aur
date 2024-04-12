# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=word2vec
_pkgver=0.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Distributed Representations of Words"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=(Apache)
depends=(
  r-rcpp
)
makedepends=(
  r-rcppprogress
)
optdepends=(
  r-udpipe
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('2fa2b87d0b3041086da4fd50135cbc4a')
b2sums=('536a341372cda93dd75509ca1e8bd5a1de9654f489ad30ffab9890fc92f3798144e01c2825c9824d09f45eaba3716ca1807b31205c8376b57a0ee44951bdb8ad')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

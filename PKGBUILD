# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=rBeta2009
_pkgver=1.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="The Beta Random Number and Dirichlet Random Vector Generating Functions"
arch=(x86_64)
url="https://cran.r-project.org/package=${_pkgname}"
license=(GPL2)
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('38000662ab8b2318b24447ca0bfa984b')
sha256sums=('d8be1df85ff880a2849013b0c4ab80138b1ae32273e803a9196a25db2ced5f52')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

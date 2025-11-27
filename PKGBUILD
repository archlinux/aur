# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=word2vec
_pkgver=0.4.1
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
md5sums=('59344e27d93a03bbe5b44c4aa3d009e4')
b2sums=('acf1ad182170459d452f0c69dc2fd80b38f584ad262312d19a31e57f9515728cc494e3e36c5900e909d15c68ad0d366b8304f808bfc202ecaf01962989148038')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

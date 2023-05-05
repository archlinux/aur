# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_cranname=mlbench
_cranver=2.1-3.1
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Machine Learning Benchmark Problems"
arch=(i686 x86_64)
url="https://cran.r-project.org/package=${_cranname}"
license=(GPL2)
depends=(r)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('7afec6d58968ab526ea642e1df39bead2f479c14486b0a62032c999ba73d5cf0')

build() {
  mkdir -p build
  R CMD INSTALL "$_cranname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_cranname" "$pkgdir/usr/lib/R/library"
}

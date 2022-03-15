# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_cranname=mlbench
_cranver=2.1-3
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Machine Learning Benchmark Problems"
arch=(i686 x86_64)
url="https://cran.r-project.org/package=${_cranname}"
license=(GPL2)
depends=(r)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('b1f92be633243185ab86e880a1e1ac5a4dd3c535d01ebd187a4872d0a8c6f194')

build() {
  mkdir -p build
  R CMD INSTALL "${_cranname}" -l "${srcdir}/build"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "build/${_cranname}" "${pkgdir}/usr/lib/R/library"
}

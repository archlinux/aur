# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_cranname=linprog
_cranver=0.9-4
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Linear Programming / Optimization"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=(GPL)
depends=(r-lpsolve)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('81a6aa2fdc075f12dc912794d0554f87705a8b872b99c89a90a69ee9ada864b4')

build() {
  mkdir -p build
  R CMD INSTALL "${_cranname}" -l "${srcdir}/build"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "build/${_cranname}" "${pkgdir}/usr/lib/R/library"
}

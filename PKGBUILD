# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=lbfgs
_pkgver=1.2.1.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Limited-memory BFGS Optimization"
arch=(x86_64)
url="https://cran.r-project.org/package=${_pkgname}"
license=(GPL)
depends=(
  r-rcpp
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('312c98ccb82f84b5a8e3ee662a866b36')
sha256sums=('7b09d886c377c8b5eb812085cd2aacb2c5ce7e38b77f9460023623dbc24edd11')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

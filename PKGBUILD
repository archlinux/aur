# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=mclustcomp
_pkgver=0.3.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Measures for Comparing Clusters"
arch=(x86_64)
url="https://cran.r-project.org/package=${_pkgname}"
license=(GPL3)
depends=(
  r-rcpp
  r-rdpack
)
makedepends=(
  r-rcpparmadillo
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('4e83a5125dae0ec5754bd0a76ed240c5')
sha256sums=('032eac106e11496de702ce5085fa2c1077811edf3f9c23c6a6c99e7a8eaeb9cf')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

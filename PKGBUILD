# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=Kendall
_pkgver=2.2.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Kendall Rank Correlation and Mann-Kendall Trend Test"
arch=(x86_64)
url="https://cran.r-project.org/package=${_pkgname}"
license=(GPL)
depends=(
  r
)
makedepends=(
  gcc-fortran
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('08c745865c00e824aaf6a721a4ef742b')
sha256sums=('55f49d1c7f268ca36e5199042c9398420c9945842cc00eac4c728e486849b3f6')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

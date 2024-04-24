# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=Kendall
_pkgver=2.2.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Kendall Rank Correlation and Mann-Kendall Trend Test"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
makedepends=(
  gcc-fortran
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('08c745865c00e824aaf6a721a4ef742b')
b2sums=('88dd0a444e8e34e3cfb53d426805c465cde1ca16f65971a6c59bc722340e5160faa10c28faaca64a3c53f516bcec2d33e973b7048d8c394dec90461db0407941')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

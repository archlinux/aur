# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=mdscore
_pkgver=0.1-3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=12
pkgdesc="Improved Score Tests for Generalized Linear Models"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
optdepends=(
  r-sleuth3
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('754815ad4ec718e3e9555d82b38d68d4')
b2sums=('87ad9cc8a5d17d0e34bf3f1f74771ab16a33b0319648d9d80d53565546316aa61572f279f74f54d49c1bd13de20f91967c3acfb165e138132d6cf5728483821b')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

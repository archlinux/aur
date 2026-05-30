# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=paws.storage
_pkgver=0.10.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="'Amazon Web Services' Storage Services"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=(Apache)
depends=(
  r-paws.common
)
optdepends=(
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('6848bcf42b82bfc6aea4312206670e65')
b2sums=('85b900cf0b642da857d45cda570be5682ff8ecdfb19960e4abdb09c822bc65554b2bed349d79107f2b2fc2f06b9d0a1cbcb4edf9d8bc72ef7beab02903ae360d')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

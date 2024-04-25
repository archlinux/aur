# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=flatxml
_pkgver=0.1.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Tools for Working with XML Files as R Dataframes"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-crayon
  r-httr
  r-rcurl
  r-xml2
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('d0fd41a013c29c04b5a17bc2e4cd7b57')
b2sums=('a1baaeeaefa0b8430077233b6fe8ca0f27705d35c726ad567641e9510186a76819c379bb32b67cda4bdd1336199288b2d24bf800aba4a275daf003ec2343bdf2')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=flatxml
_pkgver=0.1.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Tools for Working with XML Files as R Dataframes"
arch=(any)
url="https://cran.r-project.org/package=${_pkgname}"
license=(GPL3)
depends=(
  r-crayon
  r-httr
  r-rcurl
  r-xml2
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('d0fd41a013c29c04b5a17bc2e4cd7b57')
sha256sums=('db3d3dde89b6bf1ad66ed56c5938bb04b7402aa3c6690fa96c697ead50c451e3')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

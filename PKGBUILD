# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=igraphdata
_pkgver=1.0.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A Collection of Network Data Sets for the 'igraph' Package"
arch=(any)
url="https://cran.r-project.org/package=${_pkgname}"
license=('CC-BY-SA-4.0')
depends=(
  r
)
optdepends=(
  r-igraph
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('1098306b9386113ce33ad00212828663')
sha256sums=('7466426fdc1fdda90dd26d495409864e3c08ab3d997692362980a145d4b585a7')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=igraphdata
_pkgver=1.0.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="A Collection of Network Data Sets for the 'igraph' Package"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('CC-BY-SA-4.0 AND CC-BY-SA-2.0-UK AND GPL-3.0-only')
depends=(
  r
)
optdepends=(
  r-igraph
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('1098306b9386113ce33ad00212828663')
b2sums=('cd17116e7835fca5c27ca93121a1e6988c20553e4824c17fa568f4214ab977092ab66b8ea9030bec6bb069a3f1d38597afbe22f64cbae5efc5ad311909f7df8b')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

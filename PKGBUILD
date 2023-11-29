# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=clusterCons
_pkgver=1.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Consensus Clustering using Multiple Algorithms and Parameters"
arch=(any)
url="https://cran.r-project.org/package=${_pkgname}"
license=(GPL3)
depends=(
  r-apcluster
  r-rcolorbrewer
)
optdepends=(
  r-latticeextra
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('fc9dc671ef0e4e5574a319bd1bca10c4')
sha256sums=('d840cef46da3037ac7b61d604b0989d681cfe392248abeaa88de957531333ecc')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

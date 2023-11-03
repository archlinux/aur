# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=phytools
_pkgver=1.9-16
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Phylogenetic Tools for Comparative Biology (and Other Things)"
arch=(any)
url="https://cran.r-project.org/package=${_pkgname}"
license=(GPL)
depends=(
  r-ape
  r-clustergeneration
  r-coda
  r-combinat
  r-doparallel
  r-expm
  r-foreach
  r-maps
  r-mnormt
  r-numderiv
  r-optimparallel
  r-phangorn
  r-plotrix
  r-scatterplot3d
)
optdepends=(
  r-animation
  r-geiger
  r-rcolorbrewer
  r-rgl
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('a3dec8a14abffa75a1c9ba35e75a16a0')
sha256sums=('1b800b722a17679998efff40ab26adb127f61fcd57ea486ec1e129f34c79b29c')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

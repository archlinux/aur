# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=phytools
_pkgver=2.1-1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Phylogenetic Tools for Comparative Biology (and Other Things)"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
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
  r-scatterplot3d
)
optdepends=(
  r-animation
  r-geiger
  r-plotrix
  r-rcolorbrewer
  r-rgl
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b03442df6f468772b8da8784eef396e2')
b2sums=('699e9fa0c09ce3850d10a2caac64204feac28afb9fa6f976f72fc69c939086a432afdcef7aeede5ec0c44f0919e614a98106bc84dee9f16e00a355aed629410f')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

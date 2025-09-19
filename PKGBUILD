# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=phytools
_pkgver=2.5-2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Phylogenetic Tools for Comparative Biology (and Other Things)"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-ape
  r-clustergeneration
  r-coda
  r-combinat
  r-deoptim
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
md5sums=('7bc29b50ce24eef00ba94ff28a3d0eee')
b2sums=('5fb3421dd8a226d7deab39fefe1d2aaae1a58c918232da185a72229ac445cab5539c8baf33c5ad25a5e50917d2939142de8b87b2fb15201267291285ee832058')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

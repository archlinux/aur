# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=phytools
_pkgver=2.4-4
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
md5sums=('7c7c37a58b4adee64c47946cbaa4ff56')
b2sums=('b5db8928658bedecafc3b669ff5d449b3a20adc8a8fa4a9e58cf3ae785a5a82f3ab03918d065fd90085c6c9f87b49a752147183dd25487dfe993072bd43952d3')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

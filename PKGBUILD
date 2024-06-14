# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=phytools
_pkgver=2.3-0
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
md5sums=('2915ac3b549fff920e8de6ea55ad6592')
b2sums=('c07623c5bdad025474f1e622a2cb755fbc6792de899b45425566ac9035e2d8eb23c9f5e4f7a99910ff8a497f701e22117e306b92242fbb1d43655f40173d3957')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

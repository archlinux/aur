# Maintainer: Guoyi <kuoi@bioarchlinux.org>

_pkgname=ggtangle
_pkgver=0.1.5
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//[:-]/.}
pkgrel=1
pkgdesc='Draw Network with Data'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('Artistic-2.0')
depends=(
  r-ggfun
  r-ggplot2
  r-ggrepel
  r-igraph
  r-rlang
  r-yulab.utils
)
optdepends=(
  r-aplot
  r-cli
  r-ggiraph
  r-ggnewscale
  r-ggtree
  r-quarto
  r-scatterpie
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b86cdf1c5aaba2d9b006d004bedea61e')
b2sums=('d4c49b2f32da8123c9ebfc14e9e8bf433a105a5604c9a154942c6f45c41570c6cc2b867380ed426ef903ab592bb5d9e16e8fd42fd6719f6c5b5a2ea4d01a73d8')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

# Maintainer: Guoyi <kuoi@bioarchlinux.org>

_pkgname=ggtangle
_pkgver=0.1.4
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
md5sums=('2177ae6f63b7e918e7da2ea31b123c63')
b2sums=('839726f8b28782847e294a6129409536a2cdd1d48c956a879784875b09cb4b161741335cad9c3dff289c0dd9086750408ab962792ef7183c0448453c100aa4fa')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

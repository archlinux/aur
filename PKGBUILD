# Maintainer: Guoyi <kuoi@bioarchlinux.org>

_pkgname=ggtangle
_pkgver=0.1.3
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
md5sums=('10b602e913be52b9ae09ff0198171b12')
b2sums=('cd1099dfe89bad1bb1e6ec952ba109e59235482ef8096273c69a3bf55d50f31a6ac0db65e803b324915e1e37f7008d4ba8cf6a316b75ec1a81cf775e9fb3ae0c')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

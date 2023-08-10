# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ggplotify
_pkgver=0.1.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Convert Plot to 'grob' or 'ggplot' Object"
arch=(any)
url="https://cran.r-project.org/package=${_pkgname}"
license=(Artistic2.0)
depends=(
  r-ggplot2
  r-gridgraphics
  r-yulab.utils
)
optdepends=(
  r-aplot
  r-colorspace
  r-cowplot
  r-ggimage
  r-knitr
  r-prettydoc
  r-rmarkdown
  r-vcd
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('3bd4a51a0406a4b44f456aa75a8093df')
sha256sums=('01bae5759e14e211bddb04413e094ba31399b513989894ea08602d202f990e87')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

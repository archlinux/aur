# Maintainer: Guoyi <kuoi@bioarchlinux.org>

_pkgname=ggtangle
_pkgver=0.0.9
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
  r-ggnewscale
  r-ggtree
  r-knitr
  r-prettydoc
  r-rmarkdown
  r-scatterpie
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('a9b8e06cc6c2de1c6127c032568ab03c')
b2sums=('899812dd95a8a34e84ca1a5f5602548f1cbb900ed1290b313a2c2491be789d4bf18a570f9496ec75aa76f81017dc93519ca0f333eaa2e414c6a0d40ab9635799')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

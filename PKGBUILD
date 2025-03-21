# Maintainer: Guoyi <kuoi@bioarchlinux.org>

_pkgname=ggtangle
_pkgver=0.0.6
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//[:-]/.}
pkgrel=1
pkgdesc='Draw Network with Data'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('Artistic-2.0')
depends=(
  r
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
md5sums=('d93ad9bf8d3f5c11c7d6ca6cbde7832a')
b2sums=('1e4e6efb170206c49aaadbf806c5f0260ef447c391bbcc131d4f288a0db7ddd718a863f5e228a77a022da79df6b370d529bdd497d6ba8a843ce39dc46a6dff6a')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

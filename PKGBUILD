# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ggfun
_pkgver=0.1.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Miscellaneous Functions for 'ggplot2'"
arch=(any)
url="https://cran.r-project.org/package=${_pkgname}"
license=(Artistic2.0)
depends=(
  r-cli
  r-ggplot2
  r-rlang
)
optdepends=(
  r-ggnewscale
  r-ggplotify
  r-knitr
  r-prettydoc
  r-rmarkdown
  r-tidyr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('e4f9b170524457f12082835281af2990')
sha256sums=('89232ea73b7bcf3262ce4f66c7f6d05b00c5c79927c9c16d3ba8f816332669ca')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GUniFrac
_pkgver=1.8
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Generalized UniFrac Distances, Distance-Based Multivariate Methods and Feature-Based Univariate Methods for Microbiome Data Analysis"
arch=(x86_64)
url="https://cran.r-project.org/package=${_pkgname}"
license=(GPL3)
depends=(
  r-ape
  r-dirmult
  r-foreach
  r-ggplot2
  r-ggrepel
  r-inline
  r-matrixstats
  r-modeest
  r-rcpp
  r-rmutil
  r-statmod
  r-vegan
)
optdepends=(
  r-ade4
  r-ggpubr
  r-knitr
  r-markdown
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('5117c6e23fa9da45978808b23144bba3')
sha256sums=('aea41a3f94fe1fff4f4284f786a43f90bfd4f7f3c9db067c17c6e8b3206a80fb')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

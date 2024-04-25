# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GUniFrac
_pkgver=1.8
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Generalized UniFrac Distances, Distance-Based Multivariate Methods and Feature-Based Univariate Methods for Microbiome Data Analysis"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
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
b2sums=('60d6a72838858a5e241a363b2126c1b1332268beacc8d23e891ef89eaa96d537aec037724acab76d62ca8aebd9e04f438bb51eabed0cbeaa86053c73a3eaa4b2')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GUniFrac
_pkgver=1.9
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
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
md5sums=('29a84d7b7991fe4110dcf1f37c11d406')
b2sums=('7b472ebd888af563bceca88d0d0901a0ea2310d7e82ee19994731b5c5f70ba18662ace66aa4dda1ca8034472bbcc8e40c327be7ad46adfe8f5e5b4e18346a10f')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

# Maintainer: Adityarup Laha <me@adityaruplaha.me>

_pkgname=RADanalysis
_pkgver=1.0.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Normalization and Analysis of Rank Abundance Distributions"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-scales
  r-sfsmisc
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('81c5149f081ddecb1a7da2f4a888300a')
b2sums=('b629acf15cf85b05a4af013355a8b2db2ec397e6a01f4a5266e27a6e204a2562800e736af9ad995bfa61f77097201694065fe23122903f34656aa5cf77a8f509')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

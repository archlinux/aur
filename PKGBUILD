# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=genieclust
_pkgver=1.1.6
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Fast and Robust Hierarchical Clustering with Noise Points Detection"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('AGPL-3.0-only')
depends=(
  r-rcpp
)
optdepends=(
  r-mlpack
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('2cecb363ad3f489074a7990ffb67a80b')
b2sums=('c86dcc1237348d78f8edfc012f9f52b6095d8a041e72f9af886b5c8c6bbebf5b6181443088e812644b0807ff55a55724f8f93299d7486c00bc8ad70aec4b58c2')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

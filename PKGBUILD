# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=genieclust
_pkgver=1.1.5-2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
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
md5sums=('125f1f9bee8664c716c5c50816969c29')
b2sums=('f49594d6aef3d9e5d5e91b24121b3efff3a30c47697d78405816e5d1afdac577bae9db0d5654e03b02e8f31ef2336e91b3015c63375769b0db57375260c969e6')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

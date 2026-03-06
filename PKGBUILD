# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=N2R
_pkgver=1.0.4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Fast and Scalable Approximate k-Nearest Neighbor Search Methods using 'N2' Library"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('Apache-2.0')
depends=(
  r-rcpp
)
makedepends=(
  r-rcppeigen
  r-rcppspdlog
)
optdepends=(
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('1e7b2e272c683bd7f2cc7efbc50f72ac')
b2sums=('9337c446bd1ebda6d944dd7ce79e9877594e7557b6796b22169becd9c46d1ddc09448dbaccebf5849c577ab066846a44120e74b3d8e140684f74183e75fafe8b')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

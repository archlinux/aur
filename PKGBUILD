# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=N2R
_pkgver=1.0.5
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
  r-bh
  r-rcppeigen
  r-rcppspdlog
)
optdepends=(
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('72e3b2f7280f1566a6c0331bbd8e20a2')
b2sums=('061c1fcaf8e766bc90b8d2e90a772a4cd91273386aebde5f8ad36949b5b9564b00d52ef15c0ebd8abe368e2cd07e788333cba6bdac43dac7074af1fdbd0075b8')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=diagis
_pkgver=0.2.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Diagnostic Plot and Multivariate Summary Statistics of Weighted Samples from Importance Sampling"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  blas
  r-coda
  r-ggplot2
  r-gridextra
  r-rcpp
)
makedepends=(
  r-rcpparmadillo
)
optdepends=(
  r-covr
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('40c3c69f0daebc87ee7deb76b7af115d')
b2sums=('2e150f4e8bcb47c0f2053815af1907754c9315749cde7a1df7fa8b4e42d1178198e48d30f83930682f2d5a8d52a36958e7178b67dc6b3326c9517465c67d4fd2')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

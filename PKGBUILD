# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=gllvm
_pkgver=2.0.15
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Generalized Linear Latent Variable Models"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-alabama
  r-fishmod
  r-nloptr
  r-tmb
)
makedepends=(
  r-rcpp
  r-rcppeigen
)
optdepends=(
  r-ape
  r-corrplot
  r-gclus
  r-knitr
  r-mvabund
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('764fca8eecebac8cb11b93e32f75d2d4')
b2sums=('00285e8ac1c5c2f569b79b04c5ef7c80e6eda598cbd231053ccf9bc69741102da8abdbb7e212ce74c549d89e6d8aa1061a2fcf74ca9ab438b2bfc666814efd96')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

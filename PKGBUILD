# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=gllvm
_pkgver=2.0.10
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
md5sums=('44151e427d19cd64e9797e642d06448c')
b2sums=('d6278410786fa62c5639eaa84f3b48e140fcf761ccb109aa2bbba08c743662eeeef90e3644407b4d3694a1f6bb3af134739923fb1b3d1ceafe7244e8e7c258e4')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

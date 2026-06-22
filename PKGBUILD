# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=gllvm
_pkgver=2.0.11
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
md5sums=('0f16e9035bd2a57df6e5d71696981afa')
b2sums=('76bff4a6cbaafc863c8e525465a66ac7dce430758f48134abd92c2449025d0f8ed35af30813685a7331838abf8d613606b6e3b941b55de059571db4257c645f1')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

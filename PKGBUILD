# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=gllvm
_pkgver=2.0.2
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
  r-rcppeigen
)
optdepends=(
  r-corrplot
  r-gclus
  r-knitr
  r-rmarkdown
  r-testthat
  r-ape
  r-mvabund
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('34919f523d58c62100e20fc8c45fede1')
b2sums=('02286975f6a6c8541274fcc3258d1d8ee9306e434a5323d890a4775eceb92966deb8177a71b3d630904aa456f02f6015ee4b292584445267c7790b2a0c24140d')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

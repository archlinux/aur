# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=gllvm
_pkgver=2.0.5
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
md5sums=('accf2017a985b7c6eb55e5a95eae96c6')
b2sums=('4fb129c0baa4c8b99389215d065d43e7662a68e1cce92ec9bee99fbd3e82e8f568fcb9a4a3831fe993533e6874093b9528b3b54e9606f96c56c8702b79b9d696')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

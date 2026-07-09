# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=gllvm
_pkgver=2.0.13
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
md5sums=('1e69e9ebe07006c2f0de6646d7c9b1f5')
b2sums=('aebe2fe5ca7f5dfd106a47f96718cd3ec1617917fe52b451a38bbea631fde32660df3ef908457087f18e3c364d0b0b2bafb741ee30cd903d3949aca318157f76')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

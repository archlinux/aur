# Maintainer: Adityarup Laha <me@adityaruplaha.me>

_pkgname=bigsparser
_pkgver=0.7.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Sparse Matrix Format with Data on Disk"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-bigassertr
  r-rcpp
  r-rmio
)
makedepends=(
  r-rcppeigen
)
optdepends=(
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('0637c49e7696392ea8b3a1799246b628')
b2sums=('bd5c93616649d0901fbebe3f25bb5533270f7094e6c33899e4309b6fc6c4f3e27db3b5cadb75c1bd37020a058a6b59324f7b7bd4eb814160892f19aadc83c97c')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=impute
_pkgver=1.88.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Imputation for microarray data"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r
)
makedepends=(
  gcc-fortran
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('7e12bd61a77804abf283bc54f633f8c4')
b2sums=('c6803929b69b24a2cb8bdf7cfd2148c17ed7f3b723cac35b51fb72939cdf8447b1c840479d2a510dbcb4973d8d1ff2cfd95fb0481d2b0f7337c6fd6a803b4596')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ALL
_pkgver=1.47.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A data package"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-biobase
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('e09ed8b2e4fe15cbb5308cfbab038b0f')
b2sums=('2bd631e56d0ec5b22d0805cbc00ddcfcfb85559e0b5e43a73afd7731401866c73977100458e512412c994927a3a744a7d9a89948d42c87e72c0337c99fcb878b')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

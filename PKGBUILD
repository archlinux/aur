# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=INPower
_pkgver=1.46.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="An R package for computing the number of susceptibility SNPs"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-mvtnorm
)
optdepends=(
  r-biocgenerics
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('fb6609549052104c95cbf2113e6d8692')
b2sums=('8902f71303d99e1d6045a3944dcb03e7eb26bb27e8b083f034c4c3d8f7d20bad35875ce3d7d90ca5f0c3bca5b0ed7b9a6f5258ca89e938a360ecff2551da6c2b')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

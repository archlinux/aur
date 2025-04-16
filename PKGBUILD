# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MassArray
_pkgver=1.60.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Analytical Tools for MassArray Data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('6992a0dee14e7c6742c9a7a1a0cd01f4')
b2sums=('18337486a19ce5ee0c23e89b5fc202a077af8fd68ca7cb51d3293686ca6f2b1449c1bb02cbb7ac8605e4024988589c73a8c2c1f29fdc3c1b6eab137050fcae8e')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

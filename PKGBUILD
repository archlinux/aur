# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=pickgene
_pkgver=1.86.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Adaptive Gene Picking for Microarray Expression Data Analysis"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b3191c63ee2ab2d3a72c3e99c3f5616f')
b2sums=('1d6d2d50766341dee6d6b23b22c35944a8c24f8efe3cbc9ad2fe90d088463b05846ff4aa1b51f6b24aa25e5b1c8d1345036691613d09e0ca2fee49690663646c')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

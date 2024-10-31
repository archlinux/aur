# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=genoCN
_pkgver=1.58.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="genotyping and copy number study tools"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('f1d64e3799c3378276c6921f175ec367')
b2sums=('edf91b9df85038ad570fe5eda4d86ee97ee7e1bcdc4b06f20667ac25dc61e0a4882bd3b01c1673a3edd0c4a2936d0898a0b4c4d7d8bc1786c48c460d7fb6e706')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

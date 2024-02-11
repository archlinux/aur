# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CSSP
_pkgver=1.37.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="ChIP-Seq Statistical Power"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r
)
optdepends=(
  r-testthat
)
source=("https://bioconductor.org/packages/3.17/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b9a27ea7cfc6ee91619ed6a29f122def')
b2sums=('2834d9ae56907dcadb1c3085e09b8acd8eabb22e9b3433a9eb8a10d4430a9e892db157447504ebdfec01a9076e2a1e25f578426c52c81c7f3083e3e4e9fdba31')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

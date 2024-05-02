# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=metahdep
_pkgver=1.62.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Hierarchical Dependence in Meta-Analysis"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r
)
optdepends=(
  r-affyplm
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('2c901e4e34fcce1b4c0f945dfe27bcc2')
b2sums=('6685cd9ffac7044edd50201ea5977d47e5ad5bf1df2b6927258dec22530ff5277bd5b031949e72a6a4b32ca1ec3fae34b8cba2f827c90c9ef3ffd3e1152472a8')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

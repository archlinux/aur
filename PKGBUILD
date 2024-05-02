# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=cancerclass
_pkgver=1.48.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Development and validation of diagnostic tests from high-dimensional molecular data"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-binom
  r-biobase
)
optdepends=(
  r-cancerdata
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('4c236678250d52a0c0df5b65dcca301a')
b2sums=('dd1537919ef2397cb2131dbb819e8192bbcfb7c5d3ee0108e2b72ec177d64ad146518584d6dc7a86bc0535358c2a29812b11e03841da552cfac1f02e76539771')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

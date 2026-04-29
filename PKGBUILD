# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ARRmData
_pkgver=1.47.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Example dataset for normalization of Illumina 450k Methylation data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('cc7289c2f7e1e48df1da86adcc04ea64')
b2sums=('b75f5ea896dba15f0cd9206e1fcf4c4f3ed8a84cb40381c423af14a2d97a9974d3586fe2258c5ea954a80f2a8acd687d8f87d99af410e13a6643acc1d8ffab38')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

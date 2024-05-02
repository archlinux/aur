# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BHC
_pkgver=1.56.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Bayesian Hierarchical Clustering"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('5bad4023c10e01c7214084a10893cfd7')
b2sums=('178e9229f8f17d3a0437b5a1a6540aefd18ab950137bb469ab7adfdc19bc39ad8c17d5bffd38564ce663c7874fea954f6898bb8ddf259a762e26e57e6ab94677')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

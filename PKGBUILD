# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=KEGGdzPathwaysGEO
_pkgver=1.43.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="KEGG Disease Datasets from GEO"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-biobase
  r-biocgenerics
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('c7afdfb011ee785e93a11c36e8b37dc9')
b2sums=('f050899f183906bf58a3ea0a9d798f529facf7494b6a17e358b3591090579ccf5043f6994e45b41c15f9acc3b60379c0f7f21d84eb889fc29e69dfba7eba61dd')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

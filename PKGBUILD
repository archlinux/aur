# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=chopsticks
_pkgver=1.70.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="The 'snp.matrix' and 'X.snp.matrix' Classes"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r
)
optdepends=(
  r-hexbin
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('aed0c8fe67ee97b7a68fa22f8ab3b7d9')
b2sums=('4b20e85fd3f09162c75de07098a1da3eeeea9997beeed868c9406a460d5d3619c3546cedc4181034b02d1e03a9f4618a213352a3a3128092a9dcfc37e8d5ef7b')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

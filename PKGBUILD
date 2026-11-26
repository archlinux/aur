# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=snpStats
_pkgver=1.64.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="SnpMatrix and XSnpMatrix classes and methods"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-biocgenerics
  zlib
)
optdepends=(
  r-hexbin
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('39a8a34cfee1d3ea5f47f6f99e8c4b73')
b2sums=('008fce6fb988c0c43ae29bf7298444fd9d270e7d756c54f544f708f129910c3a7dca6837b79d99b07387311d563fd391dde9b22b079c909de617e2f5d1ff59b1')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

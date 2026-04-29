# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=miRNApath
_pkgver=1.72.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Pathway Enrichment for miRNA Expression Data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('LGPL-2.1-only')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('99993a16e0778bcab2587daba351adf8')
b2sums=('d6b10e350f04cd5700db6b05b08390bd5cdf7b8ff5f982d81d739b68c95b2c94d5c495a80d44f7490bff1ca9d325da4a37c749213932cb4f871c20a1cb43f873')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=garfield
_pkgver=1.32.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="GWAS Analysis of Regulatory or Functional Information Enrichment with LD correction"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r
)
optdepends=(
  r-knitr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('c45a2a9ce618721c6757e328479877e4')
b2sums=('1e9051be1177c8482b9da981e7f09be9666526279b326a163917d14a2176ceec67c376013c54e17e7cbb88abb449456085cd1156fca3cef81ff79e558781eea5')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

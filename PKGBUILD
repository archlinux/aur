# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=acde
_pkgver=1.44.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Artificial Components Detection of Differentially Expressed Genes"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r
)
optdepends=(
  r-biocgenerics
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('8458b32c2b9f6770543803338f9f6552')
b2sums=('81c33a426af2a06f85637f97e03f8759616b3c184a1e6172d2ef43601c6d122951efeb0d3b7277a0e3beebc2e20238ab60e127c3e2152f17a0b3a8c006042019')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

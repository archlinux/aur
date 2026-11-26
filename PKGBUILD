# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=globalSeq
_pkgver=1.42.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Global Test for Counts"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r
)
optdepends=(
  r-knitr
  r-s4vectors
  r-summarizedexperiment
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('9358c26ae4e7263361bba59314b97e39')
b2sums=('baadb2459fefb9a5a2bd39526334b782266d82f1f06785534b0161f5a19f3391e19720f59d96b5f6b2da982403bb56649f4688c3fe872cc907285f3816068152')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

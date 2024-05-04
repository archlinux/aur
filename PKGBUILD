# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=LungCancerACvsSCCGEO
_pkgver=1.40.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A lung cancer dataset that can be used with maPredictDSC package for developing outcome prediction models from Affymetrix CEL files"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('1d697e19f186c5268eb27786b2f9b568')
b2sums=('56f1900ffba63d0dad8e4182873c2b0597927928fdd308d1940422dc347c265b5c5f8c6e3a5bf03b9afbd1a4779f0ebb6a5fe7c472929a2b1d6297c3cf563630')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

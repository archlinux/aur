# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=proBAMr
_pkgver=1.40.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Generating SAM file for PSMs in shotgun proteomics data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-annotationdbi
  r-biostrings
  r-genomicfeatures
  r-genomicranges
  r-iranges
  r-rtracklayer
  r-txdbmaker
)
optdepends=(
  r-biocgenerics
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('ead4c9156710d421662ce7cb1ef3db20')
b2sums=('7b20155a438fe56ef75f40a6c1497c761a8e1d120e7c96a2b8bcda619850f3e59baf483ce6e5bd8d7f7e7172a7ffd218032e308480a6892b7bfc7f5e9ca246d9')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

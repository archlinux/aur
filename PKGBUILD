# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=HMMcopy
_pkgver=1.50.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Copy number prediction with correction for GC and mappability bias for HTS data"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-data.table
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('9340386169b0560bc9e3fa9b139bc20b')
b2sums=('7eab867090c18309d55a6e53665aa28122755c707df9308ce6620affda87db6b42d43406502749d0493cc60ce530dc4dfd974a580f25aa05f26bc22e8033c19a')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

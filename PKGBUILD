# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=HMMcopy
_pkgver=1.56.0
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
md5sums=('bdd342177500aeb63faf1ab31ffc6b2a')
b2sums=('b078144a777e227dce74ae1e5b029c585705baa8a4ce633404ab4ab86fd4d9d2581f36f7237ce158d6b0a8481c8e7b99968d3e50658400d4e6718111993fe67c')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

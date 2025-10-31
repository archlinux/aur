# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=HMMcopy
_pkgver=1.52.0
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
md5sums=('3e4f34694f1cbcee404682b7da942d1e')
b2sums=('5da774123abac10294937a321c74792a54316307a079ee39931e04bc676ace9bdee0d78ef9b4f567a518bbc538d7f33b5fb57fb64a4427d8649e76c7224253aa')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

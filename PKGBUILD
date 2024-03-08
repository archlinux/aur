# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=LymphoSeqDB
_pkgver=0.99.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=9
pkgdesc="LymphoSeq annotation databases"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/data/annotation/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('22fc0dc2439ef497982a5ffddda1e418')
b2sums=('e2f12dca788b6f5c052cecbda4b96b7e43bf9b38918721d65eaf9df5dfd145eef08ad56603145c0cf95b4491c0fb3b8ed88d75020a82eec265a748174d74b6ad')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

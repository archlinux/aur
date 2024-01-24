# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Rsubread
_pkgver=2.16.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Mapping, quantification and variant analysis of sequencing data"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=(GPL3)
depends=(
  r
  zlib
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('ec5687eb02901ff3b62915cf37aa48b4')
b2sums=('7a223636cbde89ce2161ee0e1a5fbccafaab7e5cb7b1e674fa039fdcbacae25d4918584d159dbbaa1abad60dd58fe01b9bb6239cf30de50babf69e229bb93e7f')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

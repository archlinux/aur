# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Rsubread
_pkgver=2.20.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Mapping, quantification and variant analysis of sequencing data"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-or-later')
depends=(
  r
  zlib
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('ff51de2d85704503bda2039364d50130')
b2sums=('9e4f60b131bf18002e980fdc387d8ab9bb166fd24bcf4730c33ddd4971b5df65882be5e74f1e7f054dad2b39e3677316ca66a627ad816f2c4f973e3a99568ae1')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

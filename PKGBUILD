# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BeadDataPackR
_pkgver=1.66.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Compression of Illumina BeadArray data"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r
)
optdepends=(
  r-biocstyle
  r-knitr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('dba781111dafd902669718630a43f334')
b2sums=('72033718c268e159f4e41ea37790775bf085024bac5707ffe0f2ad1cb4916c03fba7cdc70efcbc434689d98dd42cfc4c45b0b9910bda9388b97a25bdc2c35146')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

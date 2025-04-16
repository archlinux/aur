# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MBAmethyl
_pkgver=1.42.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Model-based analysis of DNA methylation data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('58270aac207b6edba6c772e29ce88f53')
b2sums=('172d343e0e3caf86e9d1a76b5709011dcfb7bde4593d0e948c21bc3ca8c949dbc8b7a30ce1ba8d722f9ae88aa85ff6ffcab7d866dd1de7e9349a8e82b630f2b3')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

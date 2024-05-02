# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=pickgene
_pkgver=1.76.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Adaptive Gene Picking for Microarray Expression Data Analysis"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('efd1093123ffd9d81e5cd4f5cc3853bc')
b2sums=('aa869d17ab9ed0c0a3772088ca04e6946313c6ab3be4744ff886e339e37580fb38cb198cca1bc73af0959df3bd17be55fac3f6876de9825ca76ac3c346e5a5ee')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

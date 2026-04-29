# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=pickgene
_pkgver=1.84.0
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
md5sums=('cf5cce301a080ade6bfb299332e0f2c8')
b2sums=('cadb3766274763b0a1631acb1cc81201194a93ca6fd1b77a72d4c678b18220e581bd3116b867390bb2792a2330fed1042dd7479caed4bdb01d2c0359e0d0c6ab')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

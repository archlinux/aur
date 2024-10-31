# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ASEB
_pkgver=1.50.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Predict Acetylated Lysine Sites"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-or-later')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('e3cd7166e35309e339b37d48d5f076a2')
b2sums=('adc791e8999351cdc80bb6f5505221feb3f9815b907ab72a3b23cf0ff066f333697e06cfee1ff691a8b586072595acc603a5f1bcf4d1b1ebc907b37bc7281aee')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

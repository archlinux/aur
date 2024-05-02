# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rbsurv
_pkgver=2.62.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Robust likelihood-based survival modeling with microarray data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-biobase
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('a0b87aacd20d211b277b7c708bb8577e')
b2sums=('288b16f9bf35086efbc5e22da31ef2c21367b793858c9cd24a23f4cbedd6136eda6641f548ad182cfe51fb3ff95b43e06b8452969c6e798b907d4a0fda7d21fe')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

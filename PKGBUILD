# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=fdrame
_pkgver=1.82.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="FDR adjustments of Microarray Experiments (FDR-AME)"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('6870046d24259cf94750e22f11d6609a')
b2sums=('108b2c96a5a777bf0b9be0d8f5851aa41e31a6037036b3dab484892866f8058c9dab81e251c515b5e997a049ecab649621980069dd4ca46dc9fba8ff9a7c53e2')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

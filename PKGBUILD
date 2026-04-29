# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=fdrame
_pkgver=1.84.0
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
md5sums=('04bd913a4a1dd814acbc08eaf9379295')
b2sums=('f8752876c224ec30fb452131f2e57ccba8bd865814921f350ffe020682ef0e2a32668d904dca960e5a049b8b132d18edf107b6ad54513c21b87f221075ded4e7')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

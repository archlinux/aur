# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=PMA
_pkgver=1.2-3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Penalized Multivariate Analysis"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('f4761339585ee1f7a86562b6863cd985')
b2sums=('689f0a63a3d33599ce54f7f8db557f14e78fddfe6a613ca333a02cde48a401356800a7372873ef8bc0b64bf2f29ccd0f08f43e4a442e50189c5ef33479306a13')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

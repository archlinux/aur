# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=STROMA4
_pkgver=1.24.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Assign Properties to TNBC Patients"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-biobase
  r-biocparallel
  r-matrixstats
)
optdepends=(
  r-breastcancermainz
)
source=("https://bioconductor.org/packages/3.17/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('c171d3ed28b97a1bfa044b8d360bf1f7')
b2sums=('bc979e8d2abf6d778b06572fdc8e6ada54dc6dfd183ae2886d3a4d741530ef48686c0d5d16e3c3850266e2874c5d1c9d576f21f271adaca138e7125c268720b4')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

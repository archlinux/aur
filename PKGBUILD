# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CopyhelpeR
_pkgver=1.44.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Helper files for CopywriteR"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r
)
optdepends=(
  r-biocstyle
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('7385d91d22489d77836416d259f35cdb')
b2sums=('dfe3741d4db36b675c483f9dcd043d117281da022634792946dba77275e6ab12f30dd5f6ee2d72ab55350077f000bf1e5e54c87b03ce41301dbe935c16c11f43')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

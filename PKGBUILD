# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=NuPoP
_pkgver=2.20.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="An R package for nucleosome positioning prediction"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r
)
makedepends=(
  gcc-fortran
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('d09fec774c9e2ec14952ce7fd741b149')
b2sums=('f4f73d3c8dfe79383a005ce46f3d59c23caa20f7f911fa022ad333f150d9b3781f4f217d861380fa40080cd80e2de6a8edf07c49904c9818206361612d4e2732')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

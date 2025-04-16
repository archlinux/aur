# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=NuPoP
_pkgver=2.16.0
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
md5sums=('c8d2cd43b5c47e2efe8a8da3895dba0c')
b2sums=('e922e89745479f9be6d8d8ca4a9d3bf3dd9f932f840315b6b9d5981a024b0e4f927aed5a3778b0941f116e3dada27f6551923087725a13bec92392d0537a4fb2')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

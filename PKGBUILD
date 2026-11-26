# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=FIs
_pkgver=1.42.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Human Functional Interactions (FIs) for splineTimeR package"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('72b5e14e6af28b9808f28fa4b3bc9bed')
b2sums=('872cc738622a514e2c42624dbf9fd9d8dedf6708a38c245e79ee882248d016af13458f00c47358f045982e611ddef1c582df8bff5e0b4e2c40fe7e17aba39cd0')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

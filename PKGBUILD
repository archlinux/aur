# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=pickgene
_pkgver=1.78.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Adaptive Gene Picking for Microarray Expression Data Analysis"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('fbee43148f438f3eae46783d369b7aaf')
b2sums=('8bb8bd39df9f4239f5a9963cf5f8479f02f80e64ec570279158e3527c2536c19e4fdfced29e884e01db4f47e9f4ee49911df90467293bfa53b1c51d4717bac5e')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

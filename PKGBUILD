# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=gcspikelite
_pkgver=1.41.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Spike-in data for GC/MS data and methods within flagme"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('LGPL-2.0-or-later')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('ea7925d2ea8f8371a7a169fa4edeb30a')
b2sums=('9929315d33544707fea66a1b3b8451d12ca4b905204f684a035c4112dd50399d81c3020b4083e7bc29f5745114911adc6a24e87832dbf638e6291a16e73def44')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

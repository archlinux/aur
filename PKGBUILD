# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=miRcompData
_pkgver=1.44.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Data used in the miRcomp package"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('24e7431a57e1502aaa93e0cbcbc9085b')
b2sums=('0001b001ed596b016aff82dc68b876fa3c9f158bcaa22a50feefb5806e395a3823021bcaede6e57b13a81e289228664c4086d84bf19fdcf5bc17e0e376a2eb68')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

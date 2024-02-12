# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=logitT
_pkgver=1.58.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="logit-t Package"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-affy
)
optdepends=(
  r-spikeinsubset
)
source=("https://bioconductor.org/packages/3.17/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('e5f7898ba91f4cba11868470bf76fe15')
b2sums=('13e4a377f5493cec63713247668b6f3d4966e37b50c4c5ccecc507198be01a613b3ea85be771b1c7dbc30cc66864c14b6f0abcd70c27b48dabba36e332af1a57')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

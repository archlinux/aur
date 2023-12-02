# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: sukanka <su975853527@gmail.com>

_pkgname=hgu95av2cdf
_pkgver=2.18.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=5
pkgdesc="hgu95av2cdf"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=('LGPL-2.0-or-later')
depends=(
  r-annotationdbi
)
source=("https://bioconductor.org/packages/release/data/annotation/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('026bae2f76433593f75ca6c79bc9a9d0')
sha256sums=('d449a06a2f55a5a1f942710c8da2a37a81e20342b6e600669df94ecb55f1e1fe')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}

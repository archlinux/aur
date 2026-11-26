# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=h5vcData
_pkgver=2.33.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Example data for the h5vc package"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-or-later')
depends=(
  r
)
optdepends=(
  r-h5vc
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('65ca18beeb78609fd47ee9e41cf2543f')
b2sums=('9abac930aefea75073c0113b44db02ce5cffee70f161c5639f6ca399a7fc3bbe5c07720a9d86ee1dbd2c5aae04a2412504ca7815f1d4f23afd1fd4a94cbf217d')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
